
CREATE OR REPLACE TRIGGER tg_upd_H_GENERO
AFTER DELETE OR UPDATE
ON H_GENERO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_GENERO';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.GEN_ID <> :NEW.GEN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'GEN_ID',
            :OLD.GEN_ID,
            :NEW.GEN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.GEN_DESCRICAO <> :NEW.GEN_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'GEN_DESCRICAO',
            :OLD.GEN_DESCRICAO,
            :NEW.GEN_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.GEN_DT_HIST <> :NEW.GEN_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'GEN_DT_HIST',
            :OLD.GEN_DT_HIST,
            :NEW.GEN_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
