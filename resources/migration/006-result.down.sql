ALTER TABLE IF EXISTS result
  DROP CONSTRAINT IF EXISTS previous_result_id_fkey;

ALTER TABLE IF EXISTS "check"
  DROP CONSTRAINT IF EXISTS latest_result_id_fkey;

DROP TABLE IF EXISTS result;