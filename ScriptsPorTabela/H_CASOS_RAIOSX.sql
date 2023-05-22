
CREATE OR REPLACE TRIGGER tg_upd_H_CASOS_RAIOSX
AFTER DELETE OR UPDATE
ON H_CASOS_RAIOSX
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_RAIOSX';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CRX_CAS_ID <> :NEW.CRX_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRX_CAS_ID',
            :OLD.CRX_CAS_ID,
            :NEW.CRX_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CRX_RAI_ID <> :NEW.CRX_RAI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRX_RAI_ID',
            :OLD.CRX_RAI_ID,
            :NEW.CRX_RAI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CRX_DATE <> :NEW.CRX_DATE) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRX_DATE',
            :OLD.CRX_DATE,
            :NEW.CRX_DATE,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CRX_DT_HIST <> :NEW.CRX_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRX_DT_HIST',
            :OLD.CRX_DT_HIST,
            :NEW.CRX_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
