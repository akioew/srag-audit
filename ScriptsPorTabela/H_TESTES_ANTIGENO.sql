
CREATE OR REPLACE TRIGGER tg_upd_h_TEA
AFTER DELETE OR UPDATE
ON H_TESTES_ANTIGENO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TESTES_ANTIGENO';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'TEA_CAS_ID',
          :OLD.TEA_CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TEA_CAS_ID <> :NEW.TEA_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TEA_CAS_ID',
            :OLD.TEA_CAS_ID,
            :NEW.TEA_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TEA_TTA_ID <> :NEW.TEA_TTA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TEA_TTA_ID',
            :OLD.TEA_TTA_ID,
            :NEW.TEA_TTA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TEA_RTA_ID <> :NEW.TEA_RTA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TEA_RTA_ID',
            :OLD.TEA_RTA_ID,
            :NEW.TEA_RTA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TEA_DATA_RESULTADO <> :NEW.TEA_DATA_RESULTADO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TEA_DATA_RESULTADO',
            :OLD.TEA_DATA_RESULTADO,
            :NEW.TEA_DATA_RESULTADO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TEA_DT_HIST <> :NEW.TEA_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TEA_DT_HIST',
            :OLD.TEA_DT_HIST,
            :NEW.TEA_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
