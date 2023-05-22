
CREATE OR REPLACE TRIGGER tg_upd_h_ENC
AFTER DELETE OR UPDATE
ON H_ENCERRAMENTOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ENCERRAMENTOS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'ENC_CAS_ID',
          :OLD.ENC_CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.ENC_CAS_ID <> :NEW.ENC_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ENC_CAS_ID',
            :OLD.ENC_CAS_ID,
            :NEW.ENC_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ENC_CRI_ID <> :NEW.ENC_CRI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ENC_CRI_ID',
            :OLD.ENC_CRI_ID,
            :NEW.ENC_CRI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ENC_DATA <> :NEW.ENC_DATA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ENC_DATA',
            :OLD.ENC_DATA,
            :NEW.ENC_DATA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ENC_DT_HIST <> :NEW.ENC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ENC_DT_HIST',
            :OLD.ENC_DT_HIST,
            :NEW.ENC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
