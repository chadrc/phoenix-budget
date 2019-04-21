defmodule PhoenixBudget.Repo do
  use Ecto.Repo,
    otp_app: :phoenix_budget,
    adapter: Ecto.Adapters.Postgres
end
