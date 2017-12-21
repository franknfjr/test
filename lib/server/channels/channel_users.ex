defmodule Server.Channels.ChannelUsers do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Channels.ChannelUsers
  alias Server.Accounts.User
  alias Server.Channels.Channels

  schema "channel_users" do
    field :joined_at, :naive_datetime
    belongs_to :channel, Channel
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%ChannelUsers{} = channel_users, attrs) do
    channel_users
    |> cast(attrs, [])
    |> validate_required([])
  end
end
