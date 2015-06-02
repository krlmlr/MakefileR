Version 0.3 (2015-06-02)
===

- Support `+` operator for appending rules to groups
- Remove `append_*` functions, replace `append_make_...(...)` by `c(make_...(...))` or rewrite using `+`

Version 0.2 (2015-06-02)
===

- New functions `make_group` and `make_comment`
- A Makefile (created by `makefile()`) is now a group with an initial comment
- Improve test coverage

Version 0.1 (2015-06-02)
===

- Strip `create_` prefix from functions; to adapt existing code, replace `create_make` by `make`

Version 0.0-3 (2015-06-02)
===

- New functions `create_make_def` and `append_make_def`

Version 0.0-2 (2015-05-18)
===

- Add vignette
- Full test coverage
- Fix minor whitespace glitches

Version 0.0-1 (2015-05-17)
===

- Initial release
- Functions `create_makefile`, `create_make_rule` and `append_make_rule`
