FROM elixir

# common deps, treating as separate from build of app
RUN mix local.hex --force && \
    mix local.rebar --force

ADD . /app
WORKDIR /app

ENV PORT=4000
ENV MIX_ENV=prod

ENTRYPOINT ["mix", "phx.server"]

EXPOSE 4000
