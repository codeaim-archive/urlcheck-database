CREATE TABLE IF NOT EXISTS "user" (
  id             BIGSERIAL    NOT NULL PRIMARY KEY,
  username       VARCHAR(255) NOT NULL UNIQUE,
  email          VARCHAR(255) NOT NULL UNIQUE,
  reset_token    VARCHAR(255) NOT NULL,
  access_token   VARCHAR(255) NOT NULL,
  password       VARCHAR(255) NOT NULL,
  email_verified BOOLEAN      NOT NULL,
  created        TIMESTAMP    NOT NULL,
  modified       TIMESTAMP    NOT NULL,
  version        BIGINT       NOT NULL
);