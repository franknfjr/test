defmodule Server.ChannelsTest do
  use Server.DataCase

  alias Server.Channels

  describe "channels" do
    alias Server.Channels.Channel

    @valid_attrs %{name: "some name", type: 42}
    @update_attrs %{name: "some updated name", type: 43}
    @invalid_attrs %{name: nil, type: nil}

    def channel_fixture(attrs \\ %{}) do
      {:ok, channel} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Channels.create_channel()

      channel
    end

    test "list_channels/0 returns all channels" do
      channel = channel_fixture()
      assert Channels.list_channels() == [channel]
    end

    test "get_channel!/1 returns the channel with given id" do
      channel = channel_fixture()
      assert Channels.get_channel!(channel.id) == channel
    end

    test "create_channel/1 with valid data creates a channel" do
      assert {:ok, %Channel{} = channel} = Channels.create_channel(@valid_attrs)
      assert channel.name == "some name"
      assert channel.type == 42
    end

    test "create_channel/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Channels.create_channel(@invalid_attrs)
    end

    test "update_channel/2 with valid data updates the channel" do
      channel = channel_fixture()
      assert {:ok, channel} = Channels.update_channel(channel, @update_attrs)
      assert %Channel{} = channel
      assert channel.name == "some updated name"
      assert channel.type == 43
    end

    test "update_channel/2 with invalid data returns error changeset" do
      channel = channel_fixture()
      assert {:error, %Ecto.Changeset{}} = Channels.update_channel(channel, @invalid_attrs)
      assert channel == Channels.get_channel!(channel.id)
    end

    test "delete_channel/1 deletes the channel" do
      channel = channel_fixture()
      assert {:ok, %Channel{}} = Channels.delete_channel(channel)
      assert_raise Ecto.NoResultsError, fn -> Channels.get_channel!(channel.id) end
    end

    test "change_channel/1 returns a channel changeset" do
      channel = channel_fixture()
      assert %Ecto.Changeset{} = Channels.change_channel(channel)
    end
  end

  describe "channel_users" do
    alias Server.Channels.ChannelUsers

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def channel_users_fixture(attrs \\ %{}) do
      {:ok, channel_users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Channels.create_channel_users()

      channel_users
    end

    test "list_channel_users/0 returns all channel_users" do
      channel_users = channel_users_fixture()
      assert Channels.list_channel_users() == [channel_users]
    end

    test "get_channel_users!/1 returns the channel_users with given id" do
      channel_users = channel_users_fixture()
      assert Channels.get_channel_users!(channel_users.id) == channel_users
    end

    test "create_channel_users/1 with valid data creates a channel_users" do
      assert {:ok, %ChannelUsers{} = channel_users} = Channels.create_channel_users(@valid_attrs)
    end

    test "create_channel_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Channels.create_channel_users(@invalid_attrs)
    end

    test "update_channel_users/2 with valid data updates the channel_users" do
      channel_users = channel_users_fixture()
      assert {:ok, channel_users} = Channels.update_channel_users(channel_users, @update_attrs)
      assert %ChannelUsers{} = channel_users
    end

    test "update_channel_users/2 with invalid data returns error changeset" do
      channel_users = channel_users_fixture()
      assert {:error, %Ecto.Changeset{}} = Channels.update_channel_users(channel_users, @invalid_attrs)
      assert channel_users == Channels.get_channel_users!(channel_users.id)
    end

    test "delete_channel_users/1 deletes the channel_users" do
      channel_users = channel_users_fixture()
      assert {:ok, %ChannelUsers{}} = Channels.delete_channel_users(channel_users)
      assert_raise Ecto.NoResultsError, fn -> Channels.get_channel_users!(channel_users.id) end
    end

    test "change_channel_users/1 returns a channel_users changeset" do
      channel_users = channel_users_fixture()
      assert %Ecto.Changeset{} = Channels.change_channel_users(channel_users)
    end
  end
end
