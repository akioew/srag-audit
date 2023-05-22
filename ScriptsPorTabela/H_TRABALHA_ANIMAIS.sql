
CREATE OR REPLACE TRIGGER tg_upd_h_TAN
AFTER DELETE OR UPDATE
ON H_TRABALHA_ANIMAIS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TRABALHA_ANIMAIS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'TAN_ID',
          :OLD.TAN_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TAN_ID <> :NEW.TAN_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAN_ID',
            :OLD.TAN_ID,
            :NEW.TAN_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAN_DESCRICAO <> :NEW.TAN_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAN_DESCRICAO',
            :OLD.TAN_DESCRICAO,
            :NEW.TAN_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAN_DT_HIST <> :NEW.TAN_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAN_DT_HIST',
            :OLD.TAN_DT_HIST,
            :NEW.TAN_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
