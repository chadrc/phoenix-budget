defmodule PhoenixBudgetWeb.PageController do
  use PhoenixBudgetWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
