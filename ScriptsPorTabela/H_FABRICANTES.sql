
CREATE OR REPLACE TRIGGER tg_upd_h_FAB
AFTER DELETE OR UPDATE
ON H_FABRICANTES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_FABRICANTES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'FAB_ID',
          :OLD.FAB_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.FAB_ID <> :NEW.FAB_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'FAB_ID',
            :OLD.FAB_ID,
            :NEW.FAB_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.FAB_NOME <> :NEW.FAB_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'FAB_NOME',
            :OLD.FAB_NOME,
            :NEW.FAB_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.FAB_DT_HIST <> :NEW.FAB_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'FAB_DT_HIST',
            :OLD.FAB_DT_HIST,
            :NEW.FAB_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
