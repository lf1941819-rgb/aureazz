# Supabase + Telegram (Cloud-Only) — Etapa 2

Estrutura inicial para operar 100% via dashboards (sem CLI local), com foco em schema SQL, contratos e placeholders de funções.

## Objetivo desta etapa

- Criar base de dados no Supabase via SQL Editor.
- Definir contratos de argumento (método aristotélico / anti-falácias).
- Preparar estrutura de Edge Functions e integração com Telegram.
- **Sem deploy nesta etapa**.

---

## 1) Criar projeto no Supabase

1. Acesse o dashboard: https://supabase.com/dashboard
2. Clique em **New project**.
3. Defina organization, nome, senha do banco e região.
4. Aguarde o provisionamento finalizar.

---

## 2) Executar schema SQL (001_init.sql)

1. No projeto, abra **SQL Editor**.
2. Clique em **New query**.
3. Cole o conteúdo de `supabase/sql/001_init.sql`.
4. Execute a query.

Arquivo: `supabase/sql/001_init.sql`.

---

## 3) Criar Edge Functions pelo Dashboard

No painel Supabase, criar funções com os nomes sugeridos:

- `orchestrator`
- `telegram-webhook`
- `agent-macro`
- `agent-event`
- `agent-past`
- `agent-company`
- `auditor`

> Nesta etapa, o repositório contém apenas placeholders em `supabase/functions/`.

---

## 4) Configurar Secrets no Supabase

No dashboard (Settings → Edge Functions / Secrets), adicionar pelo menos:

- `OPENAI_API_KEY`
- `TELEGRAM_BOT_TOKEN`
- `SUPABASE_URL`
- `SUPABASE_SERVICE_ROLE_KEY`
- `TELEGRAM_WEBHOOK_SECRET` (recomendado)

Opcional (dependendo de provedores futuros):
- `NEWS_API_KEY`
- `FMP_API_KEY`

---

## 5) Configurar webhook no Telegram

1. Crie um bot com **@BotFather** e obtenha o token.
2. Publique a função `telegram-webhook` (etapa futura).
3. Registre o webhook via endpoint HTTPS público da função:

```bash
https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/setWebhook?url=<URL_DA_FUNCAO_TELEGRAM-WEBHOOK>
```

Opcional com secret token:

```bash
https://api.telegram.org/bot<TELEGRAM_BOT_TOKEN>/setWebhook?url=<URL_DA_FUNCAO_TELEGRAM-WEBHOOK>&secret_token=<TELEGRAM_WEBHOOK_SECRET>
```

---

## 6) Criar Cron Jobs chamando orchestrator

No dashboard (Cron/Scheduler), criar jobs HTTP para o endpoint da função `orchestrator` com payload/param `mode`:

- `mode=T1` (cadência curta)
- `mode=T30` (cadência intermediária)
- `mode=T0` (execução pontual/sob demanda)

Sugestão de estratégia:
- T1: a cada 1 minuto
- T30: a cada 30 minutos
- T0: manual/webhook interno

---

## Estrutura criada nesta etapa

- SQL inicial: `supabase/sql/001_init.sql`
- Contratos e templates:
  - `docs/ARGUMENT_CONTRACT.md`
  - `docs/REPORT_TEMPLATES.md`
- Placeholders de funções:
  - `supabase/functions/*/README.md`

