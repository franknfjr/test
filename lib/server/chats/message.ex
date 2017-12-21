defmodule Server.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Chats.Message
  alias Server.Accounts.User
  alias Server.Channels.Channels

  schema "messages" do
    field :text, :string
    belongs_to :channel, Channel
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
