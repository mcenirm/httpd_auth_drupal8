export PGHOST=${PGHOST:-postgres}
export PGPORT=${PGPORT:-5432}
export PGDATABASE=${PGDATABASE:-postgres}
export PGUSER=${PGUSER:-postgres}
export PGPASSWORD=${PGPASSWORD:-postgres}

wait_for_database

if ! drush status bootstrap | grep -q Successful ; then
  drush -y site-install \
      --db-url=pgsql://"$PGUSER":"$PGPASSWORD"@"$PGHOST":"$PGPORT"/"$PGDATABASE" \
      standard \
      || rv=$?
  if [ "$rv" -ne 0 ] ; then
    echo drush site-install returned: "$rv"
  fi
fi

drush uli
