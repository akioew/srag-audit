
CREATE OR REPLACE TRIGGER tg_aud_h_cam
AFTER DELETE OR UPDATE
ON H_CASOS_AMOSTRAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_AMOSTRAS';
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

    IF (:OLD.CAM_CAS_ID <> :NEW.CAM_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAM_CAS_ID',
            :OLD.CAM_CAS_ID,
            :NEW.CAM_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAM_TAM_ID <> :NEW.CAM_TAM_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAM_TAM_ID',
            :OLD.CAM_TAM_ID,
            :NEW.CAM_TAM_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAM_DATA <> :NEW.CAM_DATA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAM_DATA',
            :OLD.CAM_DATA,
            :NEW.CAM_DATA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAM_DT_HIST <> :NEW.CAM_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAM_DT_HIST',
            :OLD.CAM_DT_HIST,
            :NEW.CAM_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
