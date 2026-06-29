-- Items table
create table items (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) default auth.uid(),
  kind text not null check (kind in ('todo','reminder','meeting','doc')),
  text text not null,
  body text,
  meta text,
  people text[] default '{}',
  customer text,
  priority text not null default 'normal' check (priority in ('normal','high')),
  due date,
  done boolean not null default false,
  created_at timestamptz not null default now()
);
alter table items enable row level security;
create policy "own items" on items for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);

-- Customers convenience table
create table customers (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) default auth.uid(),
  name text not null
);
alter table customers enable row level security;
create policy "own customers" on customers for all
  using (auth.uid() = user_id) with check (auth.uid() = user_id);
