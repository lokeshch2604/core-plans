# shellcheck disable=SC2148,SC1091
source ../postgresql/plan.sh

pkg_name=postgresql96
pkg_version=9.6.9
pkg_origin=core
pkg_maintainer="The Habitat Maintainers <humans@habitat.sh>"
pkg_description="PostgreSQL is a powerful, open source object-relational database system."
pkg_upstream_url="https://www.postgresql.org/"
pkg_license=('PostgreSQL')
pkg_source="https://ftp.postgresql.org/pub/source/v${pkg_version}/postgresql-${pkg_version}.tar.bz2"
pkg_shasum="b97952e3af02dc1e446f9c4188ff53021cc0eed7ed96f254ae6daf968c443e2e"
pkg_dirname="postgresql-${pkg_version}"

# Workaround `pkg_exports` check that runs before `do_build_config`
do_prepare() {
  cp "${PLAN_CONTEXT}/../postgresql/default.toml" "${PLAN_CONTEXT}/default.toml"
}

do_build_config() {
  PLAN_CONTEXT="${PLAN_CONTEXT}/../postgresql/" do_default_build_config
}

# Cleanup from our workaround in `do_prepare`
do_end() {
  rm "${PLAN_CONTEXT}/default.toml"
  do_default_end
}
