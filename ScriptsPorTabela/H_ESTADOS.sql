
CREATE OR REPLACE TRIGGER tg_upd_h_EST
AFTER DELETE OR UPDATE
ON H_ESTADOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ESTADOS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.EST_ID <> :NEW.EST_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EST_ID',
            :OLD.EST_ID,
            :NEW.EST_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.EST_NOME <> :NEW.EST_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EST_NOME',
            :OLD.EST_NOME,
            :NEW.EST_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.EST_DT_HIST <> :NEW.EST_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EST_DT_HIST',
            :OLD.EST_DT_HIST,
            :NEW.EST_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
