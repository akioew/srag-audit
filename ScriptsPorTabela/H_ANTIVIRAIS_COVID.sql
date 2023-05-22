
CREATE OR REPLACE TRIGGER tg_upd_H_ANTIVIRAIS_COVID
AFTER DELETE OR UPDATE
ON H_ANTIVIRAIS_COVID
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ANTIVIRAIS_COVID';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.ANC_ID <> :NEW.ANC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANC_ID',
            :OLD.ANC_ID,
            :NEW.ANC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ANC_NOME <> :NEW.ANC_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANC_NOME',
            :OLD.ANC_NOME,
            :NEW.ANC_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ANC_DT_HIST <> :NEW.ANC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANC_DT_HIST',
            :OLD.ANC_DT_HIST,
            :NEW.ANC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
