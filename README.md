# Milk crates

Stock MOO crates for [EigenMOO](https://github.com/StraylightRunMOO/EigenMOO). Each directory is one crate (`PACKAGE.json` + `objects/`).

## Install

On a server built with `-DEIGENMOO_GIT=ON`:

```
$server_options.git_allow_hosts = {"github.com"}
;$pkg:install($pkg.registry, ["subdir" -> "hello-utils"])
;$pkg:install("https://github.com/StraylightRunMOO/milk-crates.git", ["subdir" -> "string-utils"])
```

`$pkg.registry` defaults to this repository. The clone is shared at `repos/cache/milk-crates`; later crates from the same URL reuse it via `opts["subdir"]`.

EigenMOO also ships this tree in-repo as `packs/` for offline `snap_apply("hello-utils")` / `pkg hello-utils`.

## Layout

Hyphenated crate names at the repo root. Utils crates are children of `$generic_utils` (install that first; `$pkg:install` does). `$generic_utils:help_msg` lists every verb on a utils object via `$code_utils:verb_documentation`.

Companion `*-tests` crates are for `$pkg:test("hello-utils")` and stay out of `$pkg.catalog`.

## License

There is no repository-wide license. Each crate's `PACKAGE.json` `license` field is the license. Eigen-owned crates (`eigen-pkg`, `hello-utils`, `test-utils`, and their tests) are MIT. LambdaCore / ToastCore-derived utils leave `license` empty.
