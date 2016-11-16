CREATE TABLE IF NOT EXISTS "check" (
  id               BIGSERIAL     NOT NULL PRIMARY KEY,
  user_id          BIGINT        NOT NULL REFERENCES "user" (id) ON DELETE CASCADE,
  latest_result_id BIGINT        NULL,
  name             VARCHAR(255)  NOT NULL,
  url              VARCHAR(2000) NOT NULL,
  probe            VARCHAR(255)  NULL,
  status           status        NOT NULL DEFAULT 'UNKNOWN',
  state            state         NOT NULL DEFAULT 'WAITING',
  created          TIMESTAMP     NOT NULL,
  modified         TIMESTAMP     NOT NULL,
  refresh          TIMESTAMP     NOT NULL,
  locked           TIMESTAMP     NULL,
  interval         INT           NOT NULL,
  confirming       BOOLEAN       NOT NULL,
  version          BIGINT        NOT NULL,
  disabled         TIMESTAMP     NULL
);