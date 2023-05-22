
CREATE OR REPLACE TRIGGER tg_upd_H_VACINAS_COVID
AFTER DELETE OR UPDATE
ON H_VACINAS_COVID
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_VACINAS_COVID';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.VAC_CAS_ID <> :NEW.VAC_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_CAS_ID',
            :OLD.VAC_CAS_ID,
            :NEW.VAC_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAC_DOS_ID <> :NEW.VAC_DOS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_DOS_ID',
            :OLD.VAC_DOS_ID,
            :NEW.VAC_DOS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAC_FAB_ID <> :NEW.VAC_FAB_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_FAB_ID',
            :OLD.VAC_FAB_ID,
            :NEW.VAC_FAB_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAC_LOTE <> :NEW.VAC_LOTE) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_LOTE',
            :OLD.VAC_LOTE,
            :NEW.VAC_LOTE,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAC_DATA_APLICACAO <> :NEW.VAC_DATA_APLICACAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_DATA_APLICACAO',
            :OLD.VAC_DATA_APLICACAO,
            :NEW.VAC_DATA_APLICACAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.VAC_DT_HIST <> :NEW.VAC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'VAC_DT_HIST',
            :OLD.VAC_DT_HIST,
            :NEW.VAC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
