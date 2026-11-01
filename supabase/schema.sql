-- Diario pizza: tabelle nello STESSO progetto Supabase del Diario caffè.
-- Incolla tutto in Supabase → SQL Editor → New query, poi premi "Run".
-- Non tocca le tabelle del caffè. La cartella foto "photos" è già creata dallo schema del caffè:
-- le foto della pizza finiscono nella sottocartella <tuo-id>/pizza/.

-- Valori predefiniti per tipo di impasto (una riga per tipo: tonda, romana, teglia, pane).
create table if not exists public.pizza_defaults (
  id text primary key,
  owner uuid not null default auth.uid() references auth.users on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Registro degli impasti.
create table if not exists public.pizza_bakes (
  id text primary key,
  owner uuid not null default auth.uid() references auth.users on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Gusti (condimenti) con foto e tag.
create table if not exists public.pizza_toppings (
  id text primary key,
  owner uuid not null default auth.uid() references auth.users on delete cascade,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

-- Sicurezza: ognuno vede e modifica solo i propri dati.
alter table public.pizza_defaults enable row level security;
alter table public.pizza_bakes enable row level security;
alter table public.pizza_toppings enable row level security;

drop policy if exists "pizza_defaults: solo il proprietario" on public.pizza_defaults;
create policy "pizza_defaults: solo il proprietario" on public.pizza_defaults
  for all to authenticated
  using (owner = auth.uid()) with check (owner = auth.uid());

drop policy if exists "pizza_bakes: solo il proprietario" on public.pizza_bakes;
create policy "pizza_bakes: solo il proprietario" on public.pizza_bakes
  for all to authenticated
  using (owner = auth.uid()) with check (owner = auth.uid());

drop policy if exists "pizza_toppings: solo il proprietario" on public.pizza_toppings;
create policy "pizza_toppings: solo il proprietario" on public.pizza_toppings
  for all to authenticated
  using (owner = auth.uid()) with check (owner = auth.uid());

-- Aggiornamenti in tempo reale tra iPhone e Mac.
alter publication supabase_realtime add table public.pizza_defaults, public.pizza_bakes, public.pizza_toppings;
