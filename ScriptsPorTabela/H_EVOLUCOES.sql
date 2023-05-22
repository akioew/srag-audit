
CREATE OR REPLACE TRIGGER tg_upd_h_EVO
AFTER DELETE OR UPDATE
ON H_EVOLUCOES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_EVOLUCOES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.EVO_ID <> :NEW.EVO_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EVO_ID',
            :OLD.EVO_ID,
            :NEW.EVO_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.EVO_DESC <> :NEW.EVO_DESC) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EVO_DESC',
            :OLD.EVO_DESC,
            :NEW.EVO_DESC,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.EVO_DT_HIST <> :NEW.EVO_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'EVO_DT_HIST',
            :OLD.EVO_DT_HIST,
            :NEW.EVO_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
