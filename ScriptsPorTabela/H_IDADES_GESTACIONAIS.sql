
CREATE OR REPLACE TRIGGER tg_aud_h_idg
AFTER DELETE OR UPDATE
ON H_IDADES_GESTACIONAIS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_IDADES_GESTACIONAIS';
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

    IF (:OLD.IDG_ID <> :NEW.IDG_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'IDG_ID',
            :OLD.IDG_ID,
            :NEW.IDG_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.IDG_DESCRICAO <> :NEW.IDG_DESCRICAO) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'IDG_DESCRICAO',
            :OLD.IDG_DESCRICAO,
            :NEW.IDG_DESCRICAO,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.IDG_DT_HIST <> :NEW.IDG_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'IDG_DT_HIST',
            :OLD.IDG_DT_HIST,
            :NEW.IDG_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
