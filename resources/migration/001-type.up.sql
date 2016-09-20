DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'status') THEN
    CREATE TYPE status AS ENUM ('UNKNOWN', 'DOWN', 'UP');
  END IF;
END
$$;

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'state') THEN
    CREATE TYPE state AS ENUM ('WAITING', 'ELECTED');
  END IF;
END
$$;