defmodule PhoenixBudgetWeb.BudgetController do
  use PhoenixBudgetWeb, :controller

  alias PhoenixBudget.{Repo, Budget}

  def show(conn, %{"id" => id}) do
    render(conn, "index.html",
      id: id,
      budgets: Repo.all(Budget)
    )
  end
end
