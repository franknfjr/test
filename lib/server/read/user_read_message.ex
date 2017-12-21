defmodule Server.Read.UserReadMessage do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Chats.Message
  alias Server.Accounts.User
  alias Server.Channels.Channels

  schema "user_read_message" do
    field :message_id, :integer
    field :latest_ts, :naive_datetime
    belongs_to :user, User
    belongs_to :channel, Channel

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end

end
