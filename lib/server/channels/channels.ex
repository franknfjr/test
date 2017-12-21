defmodule Server.Channels do
  @moduledoc """
  The Channels context.
  """

  import Ecto.Query, warn: false
  alias Server.Repo

  alias Server.Channels.Channel

  @doc """
  Returns the list of channels.

  ## Examples

      iex> list_channels()
      [%Channel{}, ...]

  """
  def list_channels do
    Repo.all(Channel)
  end

  @doc """
  Gets a single channel.

  Raises `Ecto.NoResultsError` if the Channel does not exist.

  ## Examples

      iex> get_channel!(123)
      %Channel{}

      iex> get_channel!(456)
      ** (Ecto.NoResultsError)

  """
  def get_channel!(id), do: Repo.get!(Channel, id)

  @doc """
  Creates a channel.

  ## Examples

      iex> create_channel(%{field: value})
      {:ok, %Channel{}}

      iex> create_channel(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_channel(attrs \\ %{}) do
    %Channel{}
    |> Channel.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a channel.

  ## Examples

      iex> update_channel(channel, %{field: new_value})
      {:ok, %Channel{}}

      iex> update_channel(channel, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_channel(%Channel{} = channel, attrs) do
    channel
    |> Channel.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Channel.

  ## Examples

      iex> delete_channel(channel)
      {:ok, %Channel{}}

      iex> delete_channel(channel)
      {:error, %Ecto.Changeset{}}

  """
  def delete_channel(%Channel{} = channel) do
    Repo.delete(channel)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking channel changes.

  ## Examples

      iex> change_channel(channel)
      %Ecto.Changeset{source: %Channel{}}

  """
  def change_channel(%Channel{} = channel) do
    Channel.changeset(channel, %{})
  end

  alias Server.Channels.ChannelUsers

  @doc """
  Returns the list of channel_users.

  ## Examples

      iex> list_channel_users()
      [%ChannelUsers{}, ...]

  """
  def list_channel_users do
    Repo.all(ChannelUsers)
  end

  @doc """
  Gets a single channel_users.

  Raises `Ecto.NoResultsError` if the Channel users does not exist.

  ## Examples

      iex> get_channel_users!(123)
      %ChannelUsers{}

      iex> get_channel_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_channel_users!(id), do: Repo.get!(ChannelUsers, id)

  @doc """
  Creates a channel_users.

  ## Examples

      iex> create_channel_users(%{field: value})
      {:ok, %ChannelUsers{}}

      iex> create_channel_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_channel_users(attrs \\ %{}) do
    %ChannelUsers{}
    |> ChannelUsers.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a channel_users.

  ## Examples

      iex> update_channel_users(channel_users, %{field: new_value})
      {:ok, %ChannelUsers{}}

      iex> update_channel_users(channel_users, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_channel_users(%ChannelUsers{} = channel_users, attrs) do
    channel_users
    |> ChannelUsers.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ChannelUsers.

  ## Examples

      iex> delete_channel_users(channel_users)
      {:ok, %ChannelUsers{}}

      iex> delete_channel_users(channel_users)
      {:error, %Ecto.Changeset{}}

  """
  def delete_channel_users(%ChannelUsers{} = channel_users) do
    Repo.delete(channel_users)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking channel_users changes.

  ## Examples

      iex> change_channel_users(channel_users)
      %Ecto.Changeset{source: %ChannelUsers{}}

  """
  def change_channel_users(%ChannelUsers{} = channel_users) do
    ChannelUsers.changeset(channel_users, %{})
  end
end
