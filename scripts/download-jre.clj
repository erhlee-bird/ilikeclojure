#!/usr/bin/env bb

(ns script
  ^{:author "Eric Lee (erhlee.bird@gmail.com)"
    :doc "Download a tarball of the latest OpenJDK17 JRE package."}
  (:require [babashka.curl :as curl]
            [babashka.process :refer [shell]]
            [cheshire.core :as json]
            [clojure.java.io :as io]
            [clojure.pprint :refer [pprint]]
            [clojure.string :as string]))

(def link
  (->> (curl/get "https://api.adoptopenjdk.net/v2/info/releases/openjdk17")
       :body
       (json/parse-string)
       (mapcat #(get % "binaries"))
       (filter #(= (get % "architecture") "x64"))
       (filter #(= (get % "binary_type") "jre"))
       (filter #(= (get % "os") "linux"))
       ;; Sort by reverse semver.
       (sort-by #(get-in % ["version_data" "semver"]) #(compare %2 %1))
       (map #(get % "binary_link"))
       (first)))

(def request
  (curl/get link {:as :bytes}))

(def filename
  (-> (get (:headers request) "content-disposition")
      (string/split #"=" 2)
      (last)))

;; Download the tarball and unpack it.
(with-open [out (io/output-stream (str "checkouts/" filename))]
  (io/copy (:body request) out))

(shell (format "tar -C checkouts/ -xzvf %s"
               (str "checkouts/" filename)))

:ok
