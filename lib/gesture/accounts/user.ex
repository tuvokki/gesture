defmodule Gesture.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Gesture.Accounts.User


  schema "users" do
    field :age, :integer
    field :email, :string
    field :name, :string
    field :password, :string
    field :spiritanimal, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :age, :email, :spiritanimal, :password])
    |> validate_required([:name, :age, :email, :spiritanimal, :password])
  end
end
