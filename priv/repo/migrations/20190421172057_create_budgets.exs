defmodule PhoenixBudget.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :name, :string
      add :amount, :integer

      timestamps()
    end

  end
end
