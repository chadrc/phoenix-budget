defmodule PhoenixBudget.Budget do
  use Ecto.Schema
  import Ecto.Changeset

  schema "budgets" do
    field :amount, :integer
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(budget, attrs) do
    budget
    |> cast(attrs, [:name, :amount])
    |> validate_required([:name, :amount])
  end
end
