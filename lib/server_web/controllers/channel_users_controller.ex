defmodule ServerWeb.ChannelUsersController do
  use ServerWeb, :controller

  alias Server.Channels
  alias Server.Channels.ChannelUsers

  action_fallback ServerWeb.FallbackController

  def index(conn, _params) do
    channel_users = Channels.list_channel_users()
    render(conn, "index.json", channel_users: channel_users)
  end

  def create(conn, %{"channel_id" => channel_id}) do
    channel = Repo.get_by!(Channel, id: channel_id)
    case ChannelUserService.create_channel_user(channel, conn.assigns.current_user) do
      {:ok, _} ->
        conn
        |> put_status(:ok)
        |> json(%{message: "You've joined the channel!"})
      {:error, _} ->
        conn
        |> put_status(:bad_request)
        |> json(%{message: "You can't join the channel!"})
      end
  end

#  def create(conn, %{"channel_users" => channel_users_params}) do
#    with {:ok, %ChannelUsers{} = channel_users} <- Channels.create_channel_users(channel_users_params) do
#      conn
#      |> put_status(:created)
#      |> put_resp_header("location", channel_users_path(conn, :show, channel_users))
#      |> render("show.json", channel_users: channel_users)
#    end
#  end

  def show(conn, %{"id" => id}) do
    channel_users = Channels.get_channel_users!(id)
    render(conn, "show.json", channel_users: channel_users)
  end

  def update(conn, %{"id" => id, "channel_users" => channel_users_params}) do
    channel_users = Channels.get_channel_users!(id)

    with {:ok, %ChannelUsers{} = channel_users} <- Channels.update_channel_users(channel_users, channel_users_params) do
      render(conn, "show.json", channel_users: channel_users)
    end
  end

  def delete(conn, %{"id" => id}) do
    channel_users = Channels.get_channel_users!(id)
    with {:ok, %ChannelUsers{}} <- Channels.delete_channel_users(channel_users) do
      send_resp(conn, :no_content, "")
    end
  end
end
