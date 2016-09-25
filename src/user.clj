(ns user)

(ns user
  (:require
            [ragtime.jdbc :as jdbc]
            [ragtime.repl :as repl]
            [environ.core :refer [env]]))

(def migrate
  {:datastore  (jdbc/sql-database (env :database-url))
   :migrations (jdbc/load-resources "migrate")})

(def seed
  {:datastore  (jdbc/sql-database (env :database-url))
   :migrations (jdbc/load-resources "seed")
   :strategy  ragtime.strategy/apply-new})

(def sample
  {:datastore  (jdbc/sql-database (env :database-url))
   :migrations (jdbc/load-resources "sample")
   :strategy  ragtime.strategy/apply-new})



