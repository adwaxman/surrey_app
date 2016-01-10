# Postgres equivalent to heroku db:push.
# Pushes local database up to heroku application database.
#
# Usage:
#
# $ heroku_pg_push [appname] [local database name]
#
function heroku_pg_push(){
  echo "!   WARNING: Data in the Heroku app '$1' will be destroyed."
  echo "    Type '$1' to overwrite data in Heroku app '$1'"
  read heroku_app_name\?"> "
  echo
  if [ "$heroku_app_name" "==" "$1" ]; then
    heroku pg:reset DATABASE_URL -a $1
    pg_dump -xO $2 | psql `heroku config:get DATABASE_URL -a $1`
  else
    echo "Aborted"
  fi
}
