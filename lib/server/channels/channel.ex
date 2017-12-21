defmodule Server.Channels.Channel do
  use Ecto.Schema
  import Ecto.Changeset
  alias Server.Channels.Channel

  schema "channels" do
    field :name, :string
    field :type, :integer
    has_many :messages, Server.Chats.Message
    many_to_many :users, Server.Accounts.User, join_through: Server.ChannelUser
    timestamps()
  end

  @doc false
  def changeset(%Channel{} = channel, attrs) do
    channel
    |> cast(attrs, [:name, :type])
    |> validate_required([:name, :type])
  end
end
