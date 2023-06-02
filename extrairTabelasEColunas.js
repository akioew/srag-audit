const oracledb = require("oracledb");

oracledb.outFormat = oracledb.OUT_FORMAT_OBJECT;

async function run() {
  const connection = await oracledb.getConnection({
    user: "USUARIO", //Alterar usuário
    password: "SENHA", //Alterar senha
    connectString: "localhost:1521/xe",
  });

  const result = await connection.execute(
    `SELECT table_name, column_name
    FROM user_tab_columns
    WHERE table_name LIKE 'H_%'`
  );

  let array = [];

  let j = 0;

  for (i = 0; i < result.rows.length; i++) {
    if (
      array[j - 1] != undefined &&
      result.rows[i].TABLE_NAME == array[j - 1][0]
    ) {
      array[j - 1].push(result.rows[i].COLUMN_NAME);
    } else {
      array.push([result.rows[i].TABLE_NAME, result.rows[i].COLUMN_NAME]);
      j++;
    }
  }

  console.log(array);

  await connection.close();
}

run();
