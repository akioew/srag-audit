
CREATE OR REPLACE TRIGGER tg_upd_h_CAC
AFTER DELETE OR UPDATE
ON H_CASOS_ANTIVIRAIS_COVID
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_ANTIVIRAIS_COVID';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'CAC_CAS_ID',
          :OLD.CAC_CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CAC_CAS_ID <> :NEW.CAC_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAC_CAS_ID',
            :OLD.CAC_CAS_ID,
            :NEW.CAC_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAC_ANC_ID <> :NEW.CAC_ANC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAC_ANC_ID',
            :OLD.CAC_ANC_ID,
            :NEW.CAC_ANC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAC_DATA_INICIO <> :NEW.CAC_DATA_INICIO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAC_DATA_INICIO',
            :OLD.CAC_DATA_INICIO,
            :NEW.CAC_DATA_INICIO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAC_DT_HIST <> :NEW.CAC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAC_DT_HIST',
            :OLD.CAC_DT_HIST,
            :NEW.CAC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
