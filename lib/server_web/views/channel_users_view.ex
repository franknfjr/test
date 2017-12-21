defmodule ServerWeb.ChannelUsersView do
  use ServerWeb, :view
  alias ServerWeb.ChannelUsersView

  def render("index.json", %{channel_users: channel_users}) do
    %{data: render_many(channel_users, ChannelUsersView, "channel_users.json")}
  end

  def render("show.json", %{channel_users: channel_users}) do
    %{data: render_one(channel_users, ChannelUsersView, "channel_users.json")}
  end

  def render("channel_users.json", %{channel_users: channel_users}) do
    %{id: channel_users.id}
  end
end
