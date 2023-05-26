
CREATE OR REPLACE TRIGGER tg_aud_h_int
AFTER DELETE OR UPDATE
ON H_INTERNACOES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_INTERNACOES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          NULL,
          NULL,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.INT_CAS_ID <> :NEW.INT_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'INT_CAS_ID',
            :OLD.INT_CAS_ID,
            :NEW.INT_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.INT_DATA <> :NEW.INT_DATA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'INT_DATA',
            :OLD.INT_DATA,
            :NEW.INT_DATA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.INT_MUN_ID <> :NEW.INT_MUN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'INT_MUN_ID',
            :OLD.INT_MUN_ID,
            :NEW.INT_MUN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.INT_DT_HIST <> :NEW.INT_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'INT_DT_HIST',
            :OLD.INT_DT_HIST,
            :NEW.INT_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
