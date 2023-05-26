
CREATE OR REPLACE TRIGGER tg_aud_h_cto
AFTER DELETE OR UPDATE
ON H_CASOS_TOMOGRAFIA
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_TOMOGRAFIA';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          NULL,
          NULL,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CTO_CAS_ID <> :NEW.CTO_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CTO_CAS_ID',
            :OLD.CTO_CAS_ID,
            :NEW.CTO_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CTO_AST_ID <> :NEW.CTO_AST_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CTO_AST_ID',
            :OLD.CTO_AST_ID,
            :NEW.CTO_AST_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CTO_DATE <> :NEW.CTO_DATE) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CTO_DATE',
            :OLD.CTO_DATE,
            :NEW.CTO_DATE,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CTO_DT_HIST <> :NEW.CTO_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CTO_DT_HIST',
            :OLD.CTO_DT_HIST,
            :NEW.CTO_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
