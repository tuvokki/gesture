defmodule Gesture.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :password, :string
      add :spiritanimal, :string
      add :username, :string

      timestamps()
    end

    create unique_index(:users, [:username])
  end
end
