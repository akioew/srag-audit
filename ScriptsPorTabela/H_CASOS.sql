
CREATE OR REPLACE TRIGGER tg_upd_h_CAS
AFTER DELETE OR UPDATE
ON H_CASOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'CAS_ID',
          :OLD.CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CAS_ID <> :NEW.CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_ID',
            :OLD.CAS_ID,
            :NEW.CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_DATA_NOTIFICACAO <> :NEW.CAS_DATA_NOTIFICACAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_DATA_NOTIFICACAO',
            :OLD.CAS_DATA_NOTIFICACAO,
            :NEW.CAS_DATA_NOTIFICACAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_DATA_PRIMEIROS_SINTOMAS <> :NEW.CAS_DATA_PRIMEIROS_SINTOMAS) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_DATA_PRIMEIROS_SINTOMAS',
            :OLD.CAS_DATA_PRIMEIROS_SINTOMAS,
            :NEW.CAS_DATA_PRIMEIROS_SINTOMAS,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_UNI_ID <> :NEW.CAS_UNI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_UNI_ID',
            :OLD.CAS_UNI_ID,
            :NEW.CAS_UNI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_ESTRANGEIRO <> :NEW.CAS_ESTRANGEIRO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_ESTRANGEIRO',
            :OLD.CAS_ESTRANGEIRO,
            :NEW.CAS_ESTRANGEIRO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_GEN_ID <> :NEW.CAS_GEN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_GEN_ID',
            :OLD.CAS_GEN_ID,
            :NEW.CAS_GEN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_DATA_NASCIMENTO <> :NEW.CAS_DATA_NASCIMENTO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_DATA_NASCIMENTO',
            :OLD.CAS_DATA_NASCIMENTO,
            :NEW.CAS_DATA_NASCIMENTO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_IDG_ID <> :NEW.CAS_IDG_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_IDG_ID',
            :OLD.CAS_IDG_ID,
            :NEW.CAS_IDG_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_RAC_ID <> :NEW.CAS_RAC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_RAC_ID',
            :OLD.CAS_RAC_ID,
            :NEW.CAS_RAC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_ESC_ID <> :NEW.CAS_ESC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_ESC_ID',
            :OLD.CAS_ESC_ID,
            :NEW.CAS_ESC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_MUN_ID <> :NEW.CAS_MUN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_MUN_ID',
            :OLD.CAS_MUN_ID,
            :NEW.CAS_MUN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_ZON_ID <> :NEW.CAS_ZON_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_ZON_ID',
            :OLD.CAS_ZON_ID,
            :NEW.CAS_ZON_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_NOSOCOMIAL <> :NEW.CAS_NOSOCOMIAL) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_NOSOCOMIAL',
            :OLD.CAS_NOSOCOMIAL,
            :NEW.CAS_NOSOCOMIAL,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_SVE_ID <> :NEW.CAS_SVE_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_SVE_ID',
            :OLD.CAS_SVE_ID,
            :NEW.CAS_SVE_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_CLA_ID <> :NEW.CAS_CLA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_CLA_ID',
            :OLD.CAS_CLA_ID,
            :NEW.CAS_CLA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_DATA_DIGITACAO <> :NEW.CAS_DATA_DIGITACAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_DATA_DIGITACAO',
            :OLD.CAS_DATA_DIGITACAO,
            :NEW.CAS_DATA_DIGITACAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_TAN_ID <> :NEW.CAS_TAN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_TAN_ID',
            :OLD.CAS_TAN_ID,
            :NEW.CAS_TAN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAS_DT_HIST <> :NEW.CAS_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAS_DT_HIST',
            :OLD.CAS_DT_HIST,
            :NEW.CAS_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
