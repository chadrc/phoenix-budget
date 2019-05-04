FROM elixir

ENV MIX_ENV=prod

RUN mix local.hex --force && \
    mix local.rebar --force && \
    apt-get update && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs
