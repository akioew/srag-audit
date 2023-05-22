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
CREATE OR REPLACE TRIGGER tg_upd_${dadosTabelaEColunas[0]}
AFTER DELETE OR UPDATE
ON ${dadosTabelaEColunas[0]}
FOR EACH ROW
DECLARE
    user_bd VARCHAR(30) := sys_context('USERENV', 'CURRENT_USER');
    user_so VARCHAR(30) := sys_context('USERENV', 'OS_USER');
    tabela VARCHAR(30) := '${dadosTabelaEColunas[0]}';
    operacao CHAR(1);

BEGIN
    IF DELETING THEN
        operacao := 'D';
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
            ${dadosTabelaEColunas[0]},
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
