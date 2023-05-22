## SRAG - Script para gerar SQLs de Auditoria

- **ScriptAuditoria.sql:** Script com tabela, seq, trigger e procedure para executar no user AUDITORIA. Script também libera acesso da proc para user APP.
- **ScriptsPorTabela:** Scripts que serão gerados automaticamente para cada tabela e colunas de historiamento.
  -  Lista de tabelas e colunas foi extraída do SQL Developer e salva em arquivo separado (TabelasEColunas.js).

### Pendentes:
- Verificar casos onde há chave composta e concatenar tudo em uma só string.
- Incluir código no SRAG oficial e ler colunas e tabelas direto do script node (sem usar arquivo separado "TabelasEColunas.js").
- Quando executar ScriptAuditoria, conectar no user AUDITORIA e depois conectar no user APP para rodar os ScriptsPorTabela.
