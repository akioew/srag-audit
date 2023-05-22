
CREATE OR REPLACE TRIGGER tg_upd_h_RAC
AFTER DELETE OR UPDATE
ON H_RACAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_RACAS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'RAC_ID',
          :OLD.RAC_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.RAC_ID <> :NEW.RAC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAC_ID',
            :OLD.RAC_ID,
            :NEW.RAC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RAC_NOME <> :NEW.RAC_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAC_NOME',
            :OLD.RAC_NOME,
            :NEW.RAC_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RAC_DT_HIST <> :NEW.RAC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RAC_DT_HIST',
            :OLD.RAC_DT_HIST,
            :NEW.RAC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
