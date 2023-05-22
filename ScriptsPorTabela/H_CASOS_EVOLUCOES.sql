
CREATE OR REPLACE TRIGGER tg_upd_h_CEV
AFTER DELETE OR UPDATE
ON H_CASOS_EVOLUCOES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_EVOLUCOES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CEV_CAS_ID <> :NEW.CEV_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CEV_CAS_ID',
            :OLD.CEV_CAS_ID,
            :NEW.CEV_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CEV_EVO_ID <> :NEW.CEV_EVO_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CEV_EVO_ID',
            :OLD.CEV_EVO_ID,
            :NEW.CEV_EVO_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CEV_DATE <> :NEW.CEV_DATE) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CEV_DATE',
            :OLD.CEV_DATE,
            :NEW.CEV_DATE,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CEV_DT_HIST <> :NEW.CEV_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CEV_DT_HIST',
            :OLD.CEV_DT_HIST,
            :NEW.CEV_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
