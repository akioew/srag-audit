
CREATE OR REPLACE TRIGGER tg_aud_h_vir
AFTER DELETE OR UPDATE
ON H_VIRUS_RESPIRATORIOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_VIRUS_RESPIRATORIOS';
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

    IF (:OLD.VIR_ID <> :NEW.VIR_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VIR_ID',
            :OLD.VIR_ID,
            :NEW.VIR_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VIR_DES <> :NEW.VIR_DES) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VIR_DES',
            :OLD.VIR_DES,
            :NEW.VIR_DES,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VIR_DT_HIST <> :NEW.VIR_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VIR_DT_HIST',
            :OLD.VIR_DT_HIST,
            :NEW.VIR_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
