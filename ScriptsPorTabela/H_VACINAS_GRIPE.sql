
CREATE OR REPLACE TRIGGER tg_upd_H_VACINAS_GRIPE
AFTER DELETE OR UPDATE
ON H_VACINAS_GRIPE
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_VACINAS_GRIPE';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.VAG_CAS_ID <> :NEW.VAG_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAG_CAS_ID',
            :OLD.VAG_CAS_ID,
            :NEW.VAG_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAG_DATA <> :NEW.VAG_DATA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAG_DATA',
            :OLD.VAG_DATA,
            :NEW.VAG_DATA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAG_DT_HIST <> :NEW.VAG_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAG_DT_HIST',
            :OLD.VAG_DT_HIST,
            :NEW.VAG_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
