
CREATE OR REPLACE TRIGGER tg_upd_h_UTI
AFTER DELETE OR UPDATE
ON H_UTI
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_UTI';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.UTI_CAS_ID <> :NEW.UTI_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UTI_CAS_ID',
            :OLD.UTI_CAS_ID,
            :NEW.UTI_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UTI_DATA_ENTRADA <> :NEW.UTI_DATA_ENTRADA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UTI_DATA_ENTRADA',
            :OLD.UTI_DATA_ENTRADA,
            :NEW.UTI_DATA_ENTRADA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UTI_DATA_SAIDA <> :NEW.UTI_DATA_SAIDA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UTI_DATA_SAIDA',
            :OLD.UTI_DATA_SAIDA,
            :NEW.UTI_DATA_SAIDA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UTI_DT_HIST <> :NEW.UTI_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UTI_DT_HIST',
            :OLD.UTI_DT_HIST,
            :NEW.UTI_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
