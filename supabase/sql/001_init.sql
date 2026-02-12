-- 001_init.sql
-- Estrutura inicial para pipeline Supabase + Telegram (cloud-only)
-- Pode ser executado pelo SQL Editor do Supabase Dashboard.

create extension if not exists pgcrypto;

create table if not exists reports (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  mode text not null check (mode in ('T1', 'T30', 'T0')),
  doc1_md text,
  doc2_md text,
  doc3_md text,
  final_md text,
  doc1_json jsonb,
  doc2_json jsonb,
  doc3_json jsonb,
  final_json jsonb,
  ambiguity_level text,
  velocity_risk text,
  temporal_risk text,
  version int not null default 1,
  status text not null default 'PENDING' check (status in ('PENDING', 'RUNNING', 'DONE', 'FAILED', 'CANCELLED'))
);

create table if not exists premises_log (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  report_id uuid not null references reports(id) on delete cascade,
  agent text not null,
  premise_id text not null,
  premise_type text not null,
  statement text not null,
  source_url text,
  source_ts timestamptz,
  confidence numeric(4,3)
);

create table if not exists sources (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  url text not null,
  publisher text,
  published_at timestamptz,
  title text,
  content_hash text not null unique
);

create table if not exists agent_runs (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  report_id uuid not null references reports(id) on delete cascade,
  agent text not null,
  round int not null default 1,
  status text not null default 'PENDING' check (status in ('PENDING', 'RUNNING', 'DONE', 'FAILED', 'SKIPPED')),
  latency_ms int
);

create table if not exists agent_outputs (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  agent_run_id uuid not null references agent_runs(id) on delete cascade,
  payload_json jsonb,
  payload_md text
);

create table if not exists change_requests (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  title text not null,
  method text not null check (method in ('FP', 'RCA', 'PDCA')),
  plan text,
  do_step text,
  check_step text,
  act_step text,
  risk text,
  status text not null default 'OPEN' check (status in ('OPEN', 'IN_PROGRESS', 'DONE', 'REJECTED'))
);

-- Índices úteis
create index if not exists idx_reports_mode on reports(mode);
create index if not exists idx_reports_status on reports(status);
create index if not exists idx_premises_log_report_id on premises_log(report_id);
create index if not exists idx_premises_log_agent on premises_log(agent);
create index if not exists idx_sources_content_hash on sources(content_hash);
create index if not exists idx_sources_published_at on sources(published_at);
create index if not exists idx_agent_runs_report_id on agent_runs(report_id);
create index if not exists idx_agent_runs_agent_round on agent_runs(agent, round);
create index if not exists idx_agent_outputs_agent_run_id on agent_outputs(agent_run_id);
create index if not exists idx_change_requests_method_status on change_requests(method, status);
