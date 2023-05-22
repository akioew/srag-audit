const fs = require("fs");

function salvarSQL(nomeArquivo, scriptSQL) {
  fs.writeFile(nomeArquivo, scriptSQL, function (err) {
    if (err) throw err;
    console.log("Arquivo salvo: " + nomeArquivo );
  });
}

function gerarSQL(arrayTabelaEColunas) {
  const dadosTabelaEColunas = arrayTabelaEColunas;

  let scriptSQL = `
CREATE OR REPLACE TRIGGER tg_upd_h_${dadosTabelaEColunas[1].substring(0,3)}
AFTER DELETE OR UPDATE
ON ${dadosTabelaEColunas[0]}
FOR EACH ROW
DECLARE
    user_bd VARCHAR2(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR2(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR2(30) := '${dadosTabelaEColunas[0]}';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
        auditoria.proc_insere(
          SYSDATE,
          tabela,
          operacao,
          '${dadosTabelaEColunas[1]}',
          :OLD.${dadosTabelaEColunas[1]},
          NULL,
          user_bd,
          user_so,
          :OLD.rowid
        );
    ELSE
        operacao := 'U';
    END IF;
`;

  for (let i = 1; i < dadosTabelaEColunas.length; i++) {
    scriptSQL += `
    IF (:OLD.${dadosTabelaEColunas[i]} <> :NEW.${dadosTabelaEColunas[i]}) THEN
        auditoria.proc_insere(
            SYSDATE,
            tabela,
            operacao,
            '${dadosTabelaEColunas[i]}',
            :OLD.${dadosTabelaEColunas[i]},
            :NEW.${dadosTabelaEColunas[i]},
            user_bd,
            user_so,
            :OLD.rowid
        );
    END IF;
    `;
  }

  scriptSQL += `
END;
/
`;

  salvarSQL(`./ScriptsPorTabela/${dadosTabelaEColunas[0]}.sql`, scriptSQL);
}

module.exports = gerarSQL;
