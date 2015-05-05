defmodule Gamlastansmetet.Repo.Migrations.CreateSignup do
  use Ecto.Migration

  def change do
    create table(:signups) do
      add :team_name, :string
      add :phone, :string
      add :email, :string

      timestamps
    end
  end
end
