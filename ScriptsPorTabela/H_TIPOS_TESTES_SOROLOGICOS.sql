
CREATE OR REPLACE TRIGGER tg_aud_h_tts
AFTER DELETE OR UPDATE
ON H_TIPOS_TESTES_SOROLOGICOS
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := 'H_TIPOS_TESTES_SOROLOGICOS';
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

    IF (:OLD.TTS_ID <> :NEW.TTS_ID) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTS_ID',
            :OLD.TTS_ID,
            :NEW.TTS_ID,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TTS_NOME <> :NEW.TTS_NOME) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTS_NOME',
            :OLD.TTS_NOME,
            :NEW.TTS_NOME,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
    IF (:OLD.TTS_DT_HIST <> :NEW.TTS_DT_HIST) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            'TTS_DT_HIST',
            :OLD.TTS_DT_HIST,
            :NEW.TTS_DT_HIST,
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    
END;
/
