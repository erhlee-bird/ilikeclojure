#!/bin/sh

# Generate a recommended `profiles.clj` to stdout.
# Run `lein ancient check-profiles` to update.

cat <<EOF
{:user {:dependencies [[clj-kondo "2022.06.22"]]
        :plugins [[lein-ancient "0.7.0"]
                  [lein-cljfmt "0.8.2"]
                  [lein-cloverage "1.2.4"]
                  [lein-localrepo "0.5.4"]
                  [lein-kibit "0.1.8"]]
        :aliases {"clj-kondo" ["run" "-m" "clj-kondo.main"]}}}
EOF
