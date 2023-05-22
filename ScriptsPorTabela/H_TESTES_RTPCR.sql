
CREATE OR REPLACE TRIGGER tg_upd_h_TER
AFTER DELETE OR UPDATE
ON H_TESTES_RTPCR
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TESTES_RTPCR';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TER_CAS_ID <> :NEW.TER_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TER_CAS_ID',
            :OLD.TER_CAS_ID,
            :NEW.TER_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TER_RTR_ID <> :NEW.TER_RTR_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TER_RTR_ID',
            :OLD.TER_RTR_ID,
            :NEW.TER_RTR_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TER_DATA_RESULTADO <> :NEW.TER_DATA_RESULTADO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TER_DATA_RESULTADO',
            :OLD.TER_DATA_RESULTADO,
            :NEW.TER_DATA_RESULTADO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TER_DT_HIST <> :NEW.TER_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TER_DT_HIST',
            :OLD.TER_DT_HIST,
            :NEW.TER_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
