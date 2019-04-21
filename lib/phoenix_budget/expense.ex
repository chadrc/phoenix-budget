defmodule PhoenixBudget.Expense do
  use Ecto.Schema
  import Ecto.Changeset

  schema "expenses" do
    field :amount, :float
    field :name, :string
    field :category, :id

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:name, :amount])
    |> validate_required([:name, :amount])
  end
end
