
CREATE OR REPLACE TRIGGER tg_aud_h_tta
AFTER DELETE OR UPDATE
ON H_TIPOS_TESTE_ANTIGENO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TIPOS_TESTE_ANTIGENO';
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

    IF (:OLD.TTA_ID <> :NEW.TTA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTA_ID',
            :OLD.TTA_ID,
            :NEW.TTA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TTA_NOME <> :NEW.TTA_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTA_NOME',
            :OLD.TTA_NOME,
            :NEW.TTA_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TTA_DT_HIST <> :NEW.TTA_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTA_DT_HIST',
            :OLD.TTA_DT_HIST,
            :NEW.TTA_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
