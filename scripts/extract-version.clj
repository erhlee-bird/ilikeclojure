#!/usr/bin/env bb

;;;; Extract the version value from the project.

(require '[rewrite-clj.zip :as z])

(-> (slurp "src/ilikeclojure/core.clj")
    (z/of-string)
    (z/find-value z/next 'version)
    (z/up)
    (z/sexpr)
    (last)
    (println))
