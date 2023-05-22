
CREATE OR REPLACE TRIGGER tg_upd_h_MUN
AFTER DELETE OR UPDATE
ON H_MUNICIPIOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_MUNICIPIOS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'MUN_ID',
          :OLD.MUN_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.MUN_ID <> :NEW.MUN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'MUN_ID',
            :OLD.MUN_ID,
            :NEW.MUN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.MUN_COD_IBGE <> :NEW.MUN_COD_IBGE) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'MUN_COD_IBGE',
            :OLD.MUN_COD_IBGE,
            :NEW.MUN_COD_IBGE,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.MUN_NOME <> :NEW.MUN_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'MUN_NOME',
            :OLD.MUN_NOME,
            :NEW.MUN_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.MUN_EST_ID <> :NEW.MUN_EST_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'MUN_EST_ID',
            :OLD.MUN_EST_ID,
            :NEW.MUN_EST_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.MUN_DT_HIST <> :NEW.MUN_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'MUN_DT_HIST',
            :OLD.MUN_DT_HIST,
            :NEW.MUN_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
