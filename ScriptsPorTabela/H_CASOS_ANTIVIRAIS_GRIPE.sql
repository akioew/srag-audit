
CREATE OR REPLACE TRIGGER tg_upd_H_CASOS_ANTIVIRAIS_GRIPE
AFTER DELETE OR UPDATE
ON H_CASOS_ANTIVIRAIS_GRIPE
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_ANTIVIRAIS_GRIPE';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CAG_CAS_ID <> :NEW.CAG_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAG_CAS_ID',
            :OLD.CAG_CAS_ID,
            :NEW.CAG_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAG_ANG_ID <> :NEW.CAG_ANG_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAG_ANG_ID',
            :OLD.CAG_ANG_ID,
            :NEW.CAG_ANG_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAG_DATA <> :NEW.CAG_DATA) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAG_DATA',
            :OLD.CAG_DATA,
            :NEW.CAG_DATA,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CAG_DT_HIST <> :NEW.CAG_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CAG_DT_HIST',
            :OLD.CAG_DT_HIST,
            :NEW.CAG_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
