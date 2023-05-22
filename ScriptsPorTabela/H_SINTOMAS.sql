
CREATE OR REPLACE TRIGGER tg_upd_h_SIN
AFTER DELETE OR UPDATE
ON H_SINTOMAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_SINTOMAS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.SIN_ID <> :NEW.SIN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SIN_ID',
            :OLD.SIN_ID,
            :NEW.SIN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.SIN_NOME <> :NEW.SIN_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SIN_NOME',
            :OLD.SIN_NOME,
            :NEW.SIN_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.SIN_DT_HIST <> :NEW.SIN_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SIN_DT_HIST',
            :OLD.SIN_DT_HIST,
            :NEW.SIN_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/