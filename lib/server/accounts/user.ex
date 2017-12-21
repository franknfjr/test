defmodule Server.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Accounts.User


  schema "users" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true
    #many_to_many :channels, Server.Channel, join_through: Server.ChannelUser
    #has_many :channel_users, Server.ChannelUser

    timestamps()
  end

  @email_regex ~r/\A[^@\s]+@([^@\s]+\.)+[^@\W]+\z/i

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_format(:email, @email_regex)
    |> validate_length(:password, min: 6)
    |> unique_constraint(:email)
    |> put_pass_hash()
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
      %{password: password}} = changeset) do
    change(changeset, Comeonin.Bcrypt.add_hash(password))
  end
  defp put_pass_hash(changeset), do: changeset

  def username(%{email: email} = _user) do
    String.split(email, "@") |> List.first
  end
end
