CREATE TABLE IF NOT EXISTS user_role (
  id      BIGSERIAL NOT NULL PRIMARY KEY,
  user_id BIGINT    NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
  role_id BIGINT    NOT NULL REFERENCES role (id) ON DELETE CASCADE
);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'user_role_user_fkey') THEN
    CREATE INDEX user_role_user_fkey ON "user_role"(user_id);
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'user_role_role_fkey') THEN
    CREATE INDEX user_role_role_fkey ON "user_role"(role_id);
  END IF;
END;
$$;