
CREATE OR REPLACE TRIGGER tg_upd_h_TSO
AFTER DELETE OR UPDATE
ON H_TESTE_SOROLOGICOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TESTE_SOROLOGICOS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'TSO_CAS_ID',
          :OLD.TSO_CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TSO_CAS_ID <> :NEW.TSO_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_CAS_ID',
            :OLD.TSO_CAS_ID,
            :NEW.TSO_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_TAS_ID <> :NEW.TSO_TAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_TAS_ID',
            :OLD.TSO_TAS_ID,
            :NEW.TSO_TAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_TTS_ID <> :NEW.TSO_TTS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_TTS_ID',
            :OLD.TSO_TTS_ID,
            :NEW.TSO_TTS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_DATA_COLETA <> :NEW.TSO_DATA_COLETA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_DATA_COLETA',
            :OLD.TSO_DATA_COLETA,
            :NEW.TSO_DATA_COLETA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_DATA_RESULTADO <> :NEW.TSO_DATA_RESULTADO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_DATA_RESULTADO',
            :OLD.TSO_DATA_RESULTADO,
            :NEW.TSO_DATA_RESULTADO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_RTS_IGG <> :NEW.TSO_RTS_IGG) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_RTS_IGG',
            :OLD.TSO_RTS_IGG,
            :NEW.TSO_RTS_IGG,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_RTS_IGM <> :NEW.TSO_RTS_IGM) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_RTS_IGM',
            :OLD.TSO_RTS_IGM,
            :NEW.TSO_RTS_IGM,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_RTS_IGA <> :NEW.TSO_RTS_IGA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_RTS_IGA',
            :OLD.TSO_RTS_IGA,
            :NEW.TSO_RTS_IGA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSO_DT_HIST <> :NEW.TSO_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSO_DT_HIST',
            :OLD.TSO_DT_HIST,
            :NEW.TSO_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
