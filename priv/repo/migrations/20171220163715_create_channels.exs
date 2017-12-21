defmodule Server.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :type, :integer

      timestamps()
    end

  end
end
