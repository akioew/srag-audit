const tabelasEColunas = require("./TabelasEColunas.js");
const gerarSQL = require("./gerarScriptSQL.js");

for (let i = 0; i < tabelasEColunas.length; i++) {
  gerarSQL(tabelasEColunas[i]);
}
