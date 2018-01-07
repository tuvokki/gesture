defmodule Gesture.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gesture.Accounts.User


  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    field :spiritanimal, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password, :spiritanimal, :username])
    |> validate_required([:name, :email, :password, :spiritanimal, :username])
    |> unique_constraint(:username)
  end
end
