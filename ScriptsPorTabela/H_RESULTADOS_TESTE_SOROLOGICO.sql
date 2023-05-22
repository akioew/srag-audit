
CREATE OR REPLACE TRIGGER tg_upd_h_RTS
AFTER DELETE OR UPDATE
ON H_RESULTADOS_TESTE_SOROLOGICO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_RESULTADOS_TESTE_SOROLOGICO';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'RTS_ID',
          :OLD.RTS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.RTS_ID <> :NEW.RTS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTS_ID',
            :OLD.RTS_ID,
            :NEW.RTS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTS_DESC <> :NEW.RTS_DESC) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTS_DESC',
            :OLD.RTS_DESC,
            :NEW.RTS_DESC,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTS_DT_HIST <> :NEW.RTS_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTS_DT_HIST',
            :OLD.RTS_DT_HIST,
            :NEW.RTS_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
