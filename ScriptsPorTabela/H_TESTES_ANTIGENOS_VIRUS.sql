
CREATE OR REPLACE TRIGGER tg_upd_h_TSA
AFTER DELETE OR UPDATE
ON H_TESTES_ANTIGENOS_VIRUS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TESTES_ANTIGENOS_VIRUS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TSA_TEA_ID <> :NEW.TSA_TEA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSA_TEA_ID',
            :OLD.TSA_TEA_ID,
            :NEW.TSA_TEA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSA_VIR_ID <> :NEW.TSA_VIR_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSA_VIR_ID',
            :OLD.TSA_VIR_ID,
            :NEW.TSA_VIR_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSA_DT_HIST <> :NEW.TSA_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSA_DT_HIST',
            :OLD.TSA_DT_HIST,
            :NEW.TSA_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
