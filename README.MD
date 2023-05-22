## SRAG - Script para gerar SQLs de Auditoria

- **ScriptAuditoria.sql:** Script com tabela, seq, trigger e procedure para executar no user AUDITORIA. Script também libera acesso da proc para user APP.
- **ScriptsPorTabela:** Scripts que serão gerados automaticamente para cada tabela e colunas de historiamento.
  -  Lista de tabelas e colunas foi extraída do SQL Developer e salva em arquivo separado (TabelasEColunas.js).

### Pendentes:
- DÚVIDA (caso usuário delete linha inteira):
  - Trigger deve salvar somente dados da coluna ID ou criar uma linha na Tab. Auditoria para cada coluna da tabela que teve a linha deletada?
- Verificar casos onde há chave composta e concatenar tudo em uma só string.
- Incluir código no SRAG oficial e ler colunas e tabelas direto do script node (sem usar arquivo separado "TabelasEColunas.js").
- Quando executar ScriptAuditoria, conectar no user AUDITORIA e depois conectar no user APP para rodar os ScriptsPorTabela.
- ~~Atualizar nomes das triggers geradas utilizando trigramação (nome completo ultrapassa limite char oracle (30)). PRIORIDADE~~