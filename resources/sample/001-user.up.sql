DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM "user" WHERE "user".username = 'gdownes') THEN
    INSERT INTO "user"
    VALUES (DEFAULT, 'gdownes', 'gdownes@gmail.com', 'reset_token', 'access_token', 'password', TRUE, now(), now(), 1);
  END IF;
END;
$$;

