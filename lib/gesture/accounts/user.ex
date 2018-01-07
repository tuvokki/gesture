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
  
  # def validate_array_inclusion(changeset, field, allowed, options \\ []) do
  #   validate_change changeset, field, fn _field, values ->
  #     valid? = Enum.all? for value <- values, do: value in allowed
  #     if valid?, do: [], else: [{field, options[:message] || "is invalid"}]
  #   end
  # end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :age, :email, :spiritanimal, :password])
    |> validate_required([:name, :age, :email, :spiritanimal, :password])
    # |> validate_array_inclusion(:spiritanimal, ~w(unicorn dragon cow), message: "custom message here")
  end

end
