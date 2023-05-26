
CREATE OR REPLACE TRIGGER tg_aud_h_ast
AFTER DELETE OR UPDATE
ON H_ASPECTOS_TOMOGRAFIA
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ASPECTOS_TOMOGRAFIA';
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

    IF (:OLD.AST_ID <> :NEW.AST_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'AST_ID',
            :OLD.AST_ID,
            :NEW.AST_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.AST_DESCRICAO <> :NEW.AST_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'AST_DESCRICAO',
            :OLD.AST_DESCRICAO,
            :NEW.AST_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.AST_DT_HIST <> :NEW.AST_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'AST_DT_HIST',
            :OLD.AST_DT_HIST,
            :NEW.AST_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
