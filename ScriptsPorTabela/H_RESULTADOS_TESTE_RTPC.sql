
CREATE OR REPLACE TRIGGER tg_upd_h_RTR
AFTER DELETE OR UPDATE
ON H_RESULTADOS_TESTE_RTPC
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_RESULTADOS_TESTE_RTPC';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'RTR_ID',
          :OLD.RTR_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.RTR_ID <> :NEW.RTR_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTR_ID',
            :OLD.RTR_ID,
            :NEW.RTR_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTR_DES <> :NEW.RTR_DES) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTR_DES',
            :OLD.RTR_DES,
            :NEW.RTR_DES,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTR_DT_HIST <> :NEW.RTR_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTR_DT_HIST',
            :OLD.RTR_DT_HIST,
            :NEW.RTR_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
