CREATE TABLE IF NOT EXISTS result (
  id                 BIGSERIAL    NOT NULL PRIMARY KEY,
  check_id           BIGINT       NOT NULL REFERENCES "check" (id) ON DELETE CASCADE,
  previous_result_id BIGINT       NULL,
  status             status       NOT NULL,
  probe              VARCHAR(255) NOT NULL,
  status_code        INT          NOT NULL,
  response_time      BIGINT       NULL,
  changed            BOOLEAN      NOT NULL,
  confirmation       BOOLEAN      NOT NULL,
  created            TIMESTAMP    NOT NULL
);

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'latest_result_id_fkey') THEN
    ALTER TABLE "check"
      ADD CONSTRAINT latest_result_id_fkey
    FOREIGN KEY (latest_result_id) REFERENCES result (id) ON DELETE SET NULL;
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'previous_result_id_fkey') THEN
    ALTER TABLE result
      ADD CONSTRAINT previous_result_id_fkey
    FOREIGN KEY (previous_result_id) REFERENCES result (id) ON DELETE SET NULL;
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'check_user_fkey') THEN
    CREATE INDEX check_user_fkey ON "check"(user_id);
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'check_result_fkey') THEN
    CREATE INDEX check_result_fkey ON "check"(latest_result_id);
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'result_check_fkey') THEN
    CREATE INDEX result_check_fkey ON "result"(check_id);
  END IF;
END;
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'result_result_fkey') THEN
    CREATE INDEX result_result_fkey ON "result"(previous_result_id);
  END IF;
END;
$$;