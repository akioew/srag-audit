
CREATE OR REPLACE TRIGGER tg_aud_h_dos
AFTER DELETE OR UPDATE
ON H_DOSES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_DOSES';
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

    IF (:OLD.DOS_ID <> :NEW.DOS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'DOS_ID',
            :OLD.DOS_ID,
            :NEW.DOS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.DOS_DES <> :NEW.DOS_DES) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'DOS_DES',
            :OLD.DOS_DES,
            :NEW.DOS_DES,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.DOS_DT_HIST <> :NEW.DOS_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'DOS_DT_HIST',
            :OLD.DOS_DT_HIST,
            :NEW.DOS_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
