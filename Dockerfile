FROM debian:12.6
WORKDIR /app

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  sqlite3=3.40.1-2 \
  ca-certificates=20230311 \
  git=1:2.39.2-1.1 \
  curl=7.88.1-10+deb12u6 && \
  curl -OL https://github.com/sqldef/sqldef/releases/download/v0.17.17/sqlite3def_linux_amd64.tar.gz && \
  tar xf sqlite3def_linux_amd64.tar.gz -C /usr/local/bin/ && \
  rm sqlite3def_linux_amd64.tar.gz && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
