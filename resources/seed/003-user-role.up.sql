DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM user_role) THEN
    INSERT INTO user_role VALUES (DEFAULT, (SELECT id FROM "user" WHERE "user".username = 'gdownes'), (SELECT id FROM role WHERE role.name = 'registered'));
  END IF;
END;
$$;

