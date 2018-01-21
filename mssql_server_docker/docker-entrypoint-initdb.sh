#!/bin/bash
SA_PASSWORD="IoT20172018"

# wait for database to start...

sqlcmd ALTER LOGIN SA WITH PASSWORD=$SA_PASSWORD, CHECK_POLICY=OFF
sqlcmd ALTER LOGIN SA ENABLE

for i in {30..0}; do
  if sqlcmd -U SA -P $SA_PASSWORD -Q 'SELECT 1;' &> /dev/null; then
    echo "$0: SQL Server started"
    break
  fi
  echo "$0: SQL Server startup in progress..."
  sleep 5
done

echo "$0: Initializing database"
for f in /docker-entrypoint-initdb.d/*; do
  case "$f" in
    *.sh)     echo "$0: running $f"; . "$f" ;;
    *.sql)    echo "$0: running $f"; sqlcmd -U SA -P $SA_PASSWORD -X -i  "$f"; echo ;;
    *)        echo "$0: ignoring $f" ;;
  esac
  echo
done
echo "$0: SQL Server Database ready"
sqlcmd -S localhost -U sa -P $SA_PASSWORD -d master -i /usr/local/bin/smartcart-db.sql