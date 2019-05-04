FROM elixir

# common deps, treating as separate from build of app
RUN mix local.hex --force && \
    mix local.rebar --force && \

ADD . /app
WORKDIR /app

RUN mix deps.get --only prod && \
    MIX_ENV=prod mix compile && \
    cd assets && npm install && npm run deploy && cd ../ && \
    MIX_ENV=prod mix phx.digest

ENTRYPOINT ['mix', 'phx.server']

EXPOSE 4000
