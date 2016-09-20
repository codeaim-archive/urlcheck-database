DELETE FROM user_role
WHERE user_id = (SELECT id FROM "user" WHERE "user".username = 'gdownes')