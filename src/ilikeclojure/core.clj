(ns ilikeclojure.core)

(def version
  "0.1.0")

(defn foo
  ([] (foo 101))
  ([x] (inc x)))

(comment
  ;; alt + x "Calva: Start a Project REPL..."
  ;;
  ;; then for each of the following forms,
  ;; evaluate them with one of:
  ;; - alt + x "Calva: Evaluate Current Form" (or Ctrl + Enter)
  ;; - alt + x "Calva: Evaluate Current Enclosing Form" (or Ctrl + Shift + Enter)
  (require '[ilikeclojure.core :as core])
  ilikeclojure.core/version
  (core/foo))