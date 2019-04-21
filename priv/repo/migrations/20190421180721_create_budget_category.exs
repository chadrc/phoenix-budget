defmodule PhoenixBudget.Repo.Migrations.CreateBudgetCategory do
  use Ecto.Migration

  def change do
    create table(:budget_category) do
      add :budget, references(:budgets, on_delete: :nothing)
      add :category, references(:categories, on_delete: :nothing)

      timestamps()
    end

    create index(:budget_category, [:budget])
    create index(:budget_category, [:category])
  end
end
