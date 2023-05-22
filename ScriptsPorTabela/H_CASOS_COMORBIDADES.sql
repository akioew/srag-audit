
CREATE OR REPLACE TRIGGER tg_upd_h_CCO
AFTER DELETE OR UPDATE
ON H_CASOS_COMORBIDADES
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_CASOS_COMORBIDADES';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'CCO_CAS_ID',
          :OLD.CCO_CAS_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.CCO_CAS_ID <> :NEW.CCO_CAS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CCO_CAS_ID',
            :OLD.CCO_CAS_ID,
            :NEW.CCO_CAS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CCO_COM_ID <> :NEW.CCO_COM_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CCO_COM_ID',
            :OLD.CCO_COM_ID,
            :NEW.CCO_COM_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.CCO_DT_HIST <> :NEW.CCO_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'CCO_DT_HIST',
            :OLD.CCO_DT_HIST,
            :NEW.CCO_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
