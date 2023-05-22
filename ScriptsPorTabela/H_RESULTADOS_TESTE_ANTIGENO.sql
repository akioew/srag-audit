
CREATE OR REPLACE TRIGGER tg_upd_h_RTA
AFTER DELETE OR UPDATE
ON H_RESULTADOS_TESTE_ANTIGENO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_RESULTADOS_TESTE_ANTIGENO';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'RTA_ID',
          :OLD.RTA_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.RTA_ID <> :NEW.RTA_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTA_ID',
            :OLD.RTA_ID,
            :NEW.RTA_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTA_DESCRICAO <> :NEW.RTA_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTA_DESCRICAO',
            :OLD.RTA_DESCRICAO,
            :NEW.RTA_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.RTA_DT_HIST <> :NEW.RTA_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'RTA_DT_HIST',
            :OLD.RTA_DT_HIST,
            :NEW.RTA_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
