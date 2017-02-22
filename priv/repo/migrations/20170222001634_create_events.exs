defmodule ZionMetrics.Repo.Migrations.CreateData do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :project, :string
      add :version, :string
      add :brand, :string
      add :source, :string
      add :side, :string
      add :channel, :string
      add :device, :string
      add :route, :string
      add :type, :string
      add :value, :string
      
      timestamps
    end
  end
end
