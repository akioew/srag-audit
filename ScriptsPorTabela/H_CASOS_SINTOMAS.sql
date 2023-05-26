
CREATE OR REPLACE TRIGGER tg_aud_h_csi
AFTER DELETE OR UPDATE
ON H_CASOS_SINTOMAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_SINTOMAS';
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

    IF (:OLD.CSI_SIN_ID <> :NEW.CSI_SIN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CSI_SIN_ID',
            :OLD.CSI_SIN_ID,
            :NEW.CSI_SIN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CSI_CAS_ID <> :NEW.CSI_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CSI_CAS_ID',
            :OLD.CSI_CAS_ID,
            :NEW.CSI_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CSI_DT_HIST <> :NEW.CSI_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CSI_DT_HIST',
            :OLD.CSI_DT_HIST,
            :NEW.CSI_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
