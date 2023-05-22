
CREATE OR REPLACE TRIGGER tg_upd_H_CLASSIFICACOES
AFTER DELETE OR UPDATE
ON H_CLASSIFICACOES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CLASSIFICACOES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CLA_ID <> :NEW.CLA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CLA_ID',
            :OLD.CLA_ID,
            :NEW.CLA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CLA_DESC <> :NEW.CLA_DESC) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CLA_DESC',
            :OLD.CLA_DESC,
            :NEW.CLA_DESC,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CLA_DT_HIST <> :NEW.CLA_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CLA_DT_HIST',
            :OLD.CLA_DT_HIST,
            :NEW.CLA_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
