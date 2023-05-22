
CREATE OR REPLACE TRIGGER tg_upd_h_COM
AFTER DELETE OR UPDATE
ON H_COMORBIDADES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_COMORBIDADES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'COM_ID',
          :OLD.COM_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.COM_ID <> :NEW.COM_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'COM_ID',
            :OLD.COM_ID,
            :NEW.COM_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.COM_NOME <> :NEW.COM_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'COM_NOME',
            :OLD.COM_NOME,
            :NEW.COM_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.COM_DT_HIST <> :NEW.COM_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'COM_DT_HIST',
            :OLD.COM_DT_HIST,
            :NEW.COM_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
