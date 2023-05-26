
CREATE OR REPLACE TRIGGER tg_aud_h_ang
AFTER DELETE OR UPDATE
ON H_ANTIVIRAIS_GRIPE
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_ANTIVIRAIS_GRIPE';
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

    IF (:OLD.ANG_ID <> :NEW.ANG_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANG_ID',
            :OLD.ANG_ID,
            :NEW.ANG_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ANG_NOME <> :NEW.ANG_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANG_NOME',
            :OLD.ANG_NOME,
            :NEW.ANG_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.ANG_DT_HIST <> :NEW.ANG_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'ANG_DT_HIST',
            :OLD.ANG_DT_HIST,
            :NEW.ANG_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
