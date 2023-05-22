
CREATE OR REPLACE TRIGGER tg_upd_h_UNI
AFTER DELETE OR UPDATE
ON H_UNIDADES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_UNIDADES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'UNI_ID',
          :OLD.UNI_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.UNI_ID <> :NEW.UNI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UNI_ID',
            :OLD.UNI_ID,
            :NEW.UNI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UNI_COD_CNES <> :NEW.UNI_COD_CNES) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UNI_COD_CNES',
            :OLD.UNI_COD_CNES,
            :NEW.UNI_COD_CNES,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UNI_NOME <> :NEW.UNI_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UNI_NOME',
            :OLD.UNI_NOME,
            :NEW.UNI_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UNI_MUN_ID <> :NEW.UNI_MUN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UNI_MUN_ID',
            :OLD.UNI_MUN_ID,
            :NEW.UNI_MUN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.UNI_DT_HIST <> :NEW.UNI_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'UNI_DT_HIST',
            :OLD.UNI_DT_HIST,
            :NEW.UNI_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
