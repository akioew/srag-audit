
CREATE OR REPLACE TRIGGER tg_upd_h_SVE
AFTER DELETE OR UPDATE
ON H_SUPORTE_VENTILADOR
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_SUPORTE_VENTILADOR';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'SVE_ID',
          :OLD.SVE_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.SVE_ID <> :NEW.SVE_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SVE_ID',
            :OLD.SVE_ID,
            :NEW.SVE_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.SVE_DESCRICAO <> :NEW.SVE_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SVE_DESCRICAO',
            :OLD.SVE_DESCRICAO,
            :NEW.SVE_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.SVE_DT_HIST <> :NEW.SVE_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'SVE_DT_HIST',
            :OLD.SVE_DT_HIST,
            :NEW.SVE_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
