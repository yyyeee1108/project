-- Supabase 대시보드 → SQL Editor 에 통째로 붙여넣고 Run
create table if not exists public.user_state (
  user_id    uuid primary key references auth.users(id) on delete cascade,
  data       jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.user_state enable row level security;

-- 내 행만 읽고/쓰고/지울 수 있게 (다른 사람 데이터는 절대 못 봄)
drop policy if exists "own row" on public.user_state;
create policy "own row" on public.user_state
  for all
  to authenticated
  using (auth.uid() = user_id)
  with check (auth.uid() = user_id);

-- 'Automatically expose new tables'를 꺼둔 프로젝트에서도 동작하도록,
-- 로그인한 사용자(authenticated)에게만 이 테이블 권한을 명시적으로 부여 (anon=비로그인은 접근 불가)
grant select, insert, update, delete on public.user_state to authenticated;
