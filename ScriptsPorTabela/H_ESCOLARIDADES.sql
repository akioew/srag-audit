
CREATE OR REPLACE TRIGGER tg_upd_H_ESCOLARIDADES
AFTER DELETE OR UPDATE
ON H_ESCOLARIDADES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ESCOLARIDADES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.ESC_ID <> :NEW.ESC_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ESC_ID',
            :OLD.ESC_ID,
            :NEW.ESC_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ESC_DESCRICAO <> :NEW.ESC_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ESC_DESCRICAO',
            :OLD.ESC_DESCRICAO,
            :NEW.ESC_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ESC_DT_HIST <> :NEW.ESC_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ESC_DT_HIST',
            :OLD.ESC_DT_HIST,
            :NEW.ESC_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
