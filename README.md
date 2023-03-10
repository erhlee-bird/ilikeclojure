# ilikeclojure

I really like working and Clojure and I like it even better when others can
experience that joy too. This is just an opinionated scaffold for getting
started with Clojure in a Devcontainer right away.

## Getting Started

One way to get started with the language is to work with Babashka. You get to
script with a subset of Clojure with fast startup times suited to scripting and
get familiar with the language.

There are some example scripts in the `scripts/` folder to look at and try
running.

The Babashka book is also a great resource.

- https://book.babashka.org/

Learn Clojure in Y minutes is also a nice cheatsheet.

- https://learnxinyminutes.com/docs/clojure/

And the Clojure docs are really great and generally come with user-submitted
examples showcasing in what context to use different functions.

- https://clojuredocs.org/

If you are using VSCode like in the Devcontainer configuration below, it's a
good idea to get familiar with the VSCode extension Calva.

- https://calva.io/getting-started/

## Devcontainer

For ease of use, developers can start working in pre-built ready made
development environments via [GitHub Codespaces](https://github.com/features/codespaces). Codespaces are fully configured
dev environments in the cloud with a free tier of up to 60 hours a month free.

See `.devcontainer/` for more details.

[![Open in GitHub
Codespaces](https://github.com/codespaces/badge.svg)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=612030802)

The environment comes with the following pre-installed to start working with
Clojure right away:

- babashka
- calva
- clojure
- leiningen

## flake.nix

Alternatively, a `flake.nix` file is provided for developers using Nix to set
up a ready made devShell.

One recommendation is to have `nix-direnv` installed and a `.envrc` file in the
root of this git repo populated with the following:

```
use flake
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

## License

[MIT](https://choosealicense.com/licenses/mit/)
