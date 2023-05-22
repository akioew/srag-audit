
CREATE OR REPLACE TRIGGER tg_upd_h_TSR
AFTER DELETE OR UPDATE
ON H_TESTES_RTPCR_VIRUS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TESTES_RTPCR_VIRUS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'TSR_TER_ID',
          :OLD.TSR_TER_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TSR_TER_ID <> :NEW.TSR_TER_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSR_TER_ID',
            :OLD.TSR_TER_ID,
            :NEW.TSR_TER_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSR_VIR_ID <> :NEW.TSR_VIR_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSR_VIR_ID',
            :OLD.TSR_VIR_ID,
            :NEW.TSR_VIR_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TSR_DT_HIST <> :NEW.TSR_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TSR_DT_HIST',
            :OLD.TSR_DT_HIST,
            :NEW.TSR_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
