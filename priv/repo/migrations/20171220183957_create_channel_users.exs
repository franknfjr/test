defmodule Server.Repo.Migrations.CreateChannelUsers do
  use Ecto.Migration

  def change do
    create table(:channel_users) do

      timestamps()
    end

  end
end
