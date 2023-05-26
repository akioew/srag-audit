
CREATE OR REPLACE TRIGGER tg_aud_h_tas
AFTER DELETE OR UPDATE
ON H_TIPOS_AMOSTRAS_SOROLOGICAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TIPOS_AMOSTRAS_SOROLOGICAS';
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

    IF (:OLD.TAS_ID <> :NEW.TAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAS_ID',
            :OLD.TAS_ID,
            :NEW.TAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAS_NOME <> :NEW.TAS_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAS_NOME',
            :OLD.TAS_NOME,
            :NEW.TAS_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAS_DT_HIST <> :NEW.TAS_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAS_DT_HIST',
            :OLD.TAS_DT_HIST,
            :NEW.TAS_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
