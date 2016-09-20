DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM role) THEN
    INSERT INTO role VALUES (DEFAULT, 'registered', 0, '0', 0.00);
    INSERT INTO role VALUES (DEFAULT, 'free', 10, '1 day', 0.00);
    INSERT INTO role VALUES (DEFAULT, 'standard', 50, '1 week', 4.95);
    INSERT INTO role VALUES (DEFAULT, 'standard plus', 100, '1 month', 9.95);
    INSERT INTO role VALUES (DEFAULT, 'premium', 250, '3 months', 19.95);
    INSERT INTO role VALUES (DEFAULT, 'premium plus', 500, '3 months', 29.95);
    INSERT INTO role VALUES (DEFAULT, 'professional', 1000, '6 months', 49.95);
    INSERT INTO role VALUES (DEFAULT, 'professional plus', 2000, '6 months', 89.95);
    INSERT INTO role VALUES (DEFAULT, 'enterprise', 5000, '1 year', 179.95);
    INSERT INTO role VALUES (DEFAULT, 'enterprise plus', 10000, '1 year', 349.95);
    INSERT INTO role VALUES (DEFAULT, 'admin', 0, '0', 0.00);
  END IF;
END;
$$;