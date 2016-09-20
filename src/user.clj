(ns user)

(ns user
  (:require
            [ragtime.jdbc :as jdbc]
            [ragtime.repl :as repl]
            [environ.core :refer [env]]))

(def config
  {:datastore  (jdbc/sql-database (env :database-url))
   :migrations (jdbc/load-resources "migration")})

(def seed
  {:datastore  (jdbc/sql-database (env :database-url))
   :migrations (jdbc/load-resources "seed")
   :strategy  ragtime.strategy/apply-new})



