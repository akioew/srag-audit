
CREATE OR REPLACE TRIGGER tg_upd_h_CRI
AFTER DELETE OR UPDATE
ON H_CRITERIOS_ENCERRAMENTO
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CRITERIOS_ENCERRAMENTO';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'CRI_ID',
          :OLD.CRI_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CRI_ID <> :NEW.CRI_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRI_ID',
            :OLD.CRI_ID,
            :NEW.CRI_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CRI_DESC <> :NEW.CRI_DESC) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRI_DESC',
            :OLD.CRI_DESC,
            :NEW.CRI_DESC,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CRI_DT_HIST <> :NEW.CRI_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CRI_DT_HIST',
            :OLD.CRI_DT_HIST,
            :NEW.CRI_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
