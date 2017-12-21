defmodule ServerWeb.ChannelUsersControllerTest do
  use ServerWeb.ConnCase

  alias Server.Channels
  alias Server.Channels.ChannelUsers

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:channel_users) do
    {:ok, channel_users} = Channels.create_channel_users(@create_attrs)
    channel_users
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all channel_users", %{conn: conn} do
      conn = get conn, channel_users_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create channel_users" do
    test "renders channel_users when data is valid", %{conn: conn} do
      conn = post conn, channel_users_path(conn, :create), channel_users: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, channel_users_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, channel_users_path(conn, :create), channel_users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update channel_users" do
    setup [:create_channel_users]

    test "renders channel_users when data is valid", %{conn: conn, channel_users: %ChannelUsers{id: id} = channel_users} do
      conn = put conn, channel_users_path(conn, :update, channel_users), channel_users: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, channel_users_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id}
    end

    test "renders errors when data is invalid", %{conn: conn, channel_users: channel_users} do
      conn = put conn, channel_users_path(conn, :update, channel_users), channel_users: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete channel_users" do
    setup [:create_channel_users]

    test "deletes chosen channel_users", %{conn: conn, channel_users: channel_users} do
      conn = delete conn, channel_users_path(conn, :delete, channel_users)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, channel_users_path(conn, :show, channel_users)
      end
    end
  end

  defp create_channel_users(_) do
    channel_users = fixture(:channel_users)
    {:ok, channel_users: channel_users}
  end
end
