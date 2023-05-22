
CREATE OR REPLACE TRIGGER tg_upd_H_ZONAS
AFTER DELETE OR UPDATE
ON H_ZONAS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ZONAS';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.ZON_ID <> :NEW.ZON_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ZON_ID',
            :OLD.ZON_ID,
            :NEW.ZON_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ZON_DESCRICAO <> :NEW.ZON_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ZON_DESCRICAO',
            :OLD.ZON_DESCRICAO,
            :NEW.ZON_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ZON_DT_HIST <> :NEW.ZON_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ZON_DT_HIST',
            :OLD.ZON_DT_HIST,
            :NEW.ZON_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
