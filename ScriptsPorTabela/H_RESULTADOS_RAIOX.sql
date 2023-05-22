
CREATE OR REPLACE TRIGGER tg_upd_h_RAI
AFTER DELETE OR UPDATE
ON H_RESULTADOS_RAIOX
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_RESULTADOS_RAIOX';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'RAI_ID',
          :OLD.RAI_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.RAI_ID <> :NEW.RAI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAI_ID',
            :OLD.RAI_ID,
            :NEW.RAI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RAI_DESC <> :NEW.RAI_DESC) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAI_DESC',
            :OLD.RAI_DESC,
            :NEW.RAI_DESC,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RAI_DT_HIST <> :NEW.RAI_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAI_DT_HIST',
            :OLD.RAI_DT_HIST,
            :NEW.RAI_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
