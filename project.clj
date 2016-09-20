(defproject urlcheck-database "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "Apache License, Version 2.0"
            :url "http://www.apache.org/licenses/LICENSE-2.0.html"}
  :plugins [[lein-environ "1.1.0"]]
  :dependencies [[org.clojure/clojure "1.8.0"]
                 [ragtime "0.6.3"]
                 [environ "1.1.0"]
                 [org.clojure/java.jdbc "0.6.1"]
                 [org.postgresql/postgresql "9.4.1210"]]
  :profiles {:dev {:env {:database-url "jdbc:postgresql://localhost:5432/postgres?user=postgres&password=password"}}})
