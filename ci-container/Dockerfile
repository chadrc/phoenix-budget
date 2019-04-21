FROM elixir

RUN mix local.hex --force && \
    apt-get update && \
    curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash - && \
    apt-get install -y nodejs
