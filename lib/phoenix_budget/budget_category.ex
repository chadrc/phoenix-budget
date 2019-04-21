defmodule PhoenixBudget.BudgetCategory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budget_category" do
    field :budget, :id
    field :category, :id

    timestamps()
  end

  @doc false
  def changeset(budget_category, attrs) do
    budget_category
    |> cast(attrs, [])
    |> validate_required([])
  end
end
