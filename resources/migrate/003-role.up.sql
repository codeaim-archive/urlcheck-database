CREATE TABLE IF NOT EXISTS role (
  id                        BIGSERIAL    NOT NULL PRIMARY KEY,
  name                      VARCHAR(255) NOT NULL UNIQUE,
  check_limit               BIGINT       NOT NULL,
  result_retention_duration INTERVAL     NOT NULL,
  price                     DECIMAL      NOT NULL
);