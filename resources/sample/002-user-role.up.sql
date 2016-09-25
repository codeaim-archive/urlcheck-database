DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM user_role INNER JOIN "user" ON user_role.user_id = "user".id WHERE "user".username = 'gdownes') THEN
    INSERT INTO user_role VALUES (DEFAULT, (SELECT id FROM "user" WHERE "user".username = 'gdownes'), (SELECT id FROM role WHERE role.name = 'registered'));
    INSERT INTO user_role VALUES (DEFAULT, (SELECT id FROM "user" WHERE "user".username = 'gdownes'), (SELECT id FROM role WHERE role.name = 'free'));
    INSERT INTO user_role VALUES (DEFAULT, (SELECT id FROM "user" WHERE "user".username = 'gdownes'), (SELECT id FROM role WHERE role.name = 'admin'));
  END IF;
END;
$$;

