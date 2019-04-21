defmodule PhoenixBudgetWeb.BudgetController do
  use PhoenixBudgetWeb, :controller

  def index(conn, %{"id" => id}) do
    render(conn, "index.html", id: id)
  end
end
