#!/bin/bash
set -e

cat > /hibiscus-server/cfg/de.willuhn.jameica.hbci.rmi.HBCIDBService.properties <<EOF
database.driver.mysql.jdbcdriver=org.mariadb.jdbc.Driver
database.driver.mysql.jdbcurl=jdbc\:mysql\://${DB_HOST}/${DB_NAME}?useUnicode\=Yes&characterEncoding\=ISO8859_1
database.driver.mysql.username=${DB_USERNAME}
database.driver.mysql.password=${DB_PASSWORD}
EOF

cat > /hibiscus-server/cfg/de.willuhn.jameica.webadmin.Plugin.properties <<EOF
listener.http.address=0.0.0.0
listener.http.port=8080
listener.http.auth=true
listener.http.ssl=false
EOF

${@-/hibiscus-server/jameicaserver.sh -p $PASSWORD -f /srv/hibiscus}
