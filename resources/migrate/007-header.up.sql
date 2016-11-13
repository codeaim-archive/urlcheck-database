CREATE TABLE IF NOT EXISTS header (
  id                BIGSERIAL    NOT NULL PRIMARY KEY,
  check_id          BIGINT       NOT NULL REFERENCES "check" (id) ON DELETE CASCADE,
  name              VARCHAR(2000) NOT NULL,
  value             VARCHAR(2000) NOT NULL
);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'header_check_fkey') THEN
    CREATE INDEX header_check_fkey ON "header"(check_id);
  END IF;
END;
$$;