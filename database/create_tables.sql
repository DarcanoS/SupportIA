-- 1) tickets: info general del ticket
create table if not exists tickets (
  id               bigserial primary key,
  usuario          text not null,
  creado_en        timestamptz not null default now(),
  actualizado_en   timestamptz not null default now()
);

-- 2) mensajes: histórico de mensajes del ticket
create table if not exists mensajes (
  id               bigserial primary key,
  ticket_id        bigserial not null references tickets(id) on delete cascade,
  autor            text not null default 'IA',
  mensaje          text not null,
  creado_en        timestamptz not null default now()
);

create index if not exists idx_mensajes_ticket_time
  on mensajes (ticket_id, creado_en desc);

-- 3) validacion: foto de la validación del último mensaje (una fila por ticket)
create table if not exists validacion (
  ticket_id        bigint primary key references tickets(id) on delete cascade,
  actualizado_en   timestamptz not null default now(),

  -- Campos extraídos por la IA (texto libre)
  aplicativo_text    text,
  modulo_text        text,
  opcion_text        text,
  motivo_falla_text  text,
  pasos_text         text,
  esperado_text      text,

  -- Flag calculado automáticamente
  completo boolean generated always as (
    coalesce(length(trim(aplicativo_text))    > 0, false) and
    coalesce(length(trim(modulo_text))        > 0, false) and
    coalesce(length(trim(opcion_text))        > 0, false) and
    coalesce(length(trim(motivo_falla_text))  > 0, false) and
    coalesce(length(trim(pasos_text))         > 0, false) and
    coalesce(length(trim(esperado_text))      > 0, false)
  ) stored
);

-- Trigger para mantener actualizado 'actualizado_en'
create or replace function set_updated_at() returns trigger as $$
begin
  new.actualizado_en = now();
  return new;
end; $$ language plpgsql;

drop trigger if exists trg_tickets_updated on tickets;
create trigger trg_tickets_updated
before update on tickets
for each row execute function set_updated_at();

drop trigger if exists trg_validacion_updated on validacion;
create trigger trg_validacion_updated
before update on validacion
for each row execute function set_updated_at();
