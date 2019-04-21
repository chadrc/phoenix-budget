defmodule PhoenixBudget.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :name, :string
      add :amount, :float
      add :category, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:expenses, [:category])
  end
end
