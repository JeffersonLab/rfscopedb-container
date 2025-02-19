FROM mariadb:10.5

COPY ./docker-entrypoint-initdb.d/* /docker-entrypoint-initdb.d

HEALTHCHECK --interval=10s --timeout=5s --retries=6 \
  CMD (echo 'use scope_waveforms' | mysql -u scope_rw -ppassword) || exit 1
