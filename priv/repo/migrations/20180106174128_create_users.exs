defmodule Gesture.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      add :spiritanimal, :string
      add :password, :string

      timestamps()
    end

  end
end
