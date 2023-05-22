
CREATE OR REPLACE TRIGGER tg_upd_h_TAM
AFTER DELETE OR UPDATE
ON H_TIPOS_AMOSTRA
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TIPOS_AMOSTRA';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          'TAM_ID',
          :OLD.TAM_ID,
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;

    IF (:OLD.TAM_ID <> :NEW.TAM_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAM_ID',
            :OLD.TAM_ID,
            :NEW.TAM_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAM_NOME <> :NEW.TAM_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAM_NOME',
            :OLD.TAM_NOME,
            :NEW.TAM_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TAM_DT_HIST <> :NEW.TAM_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TAM_DT_HIST',
            :OLD.TAM_DT_HIST,
            :NEW.TAM_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
