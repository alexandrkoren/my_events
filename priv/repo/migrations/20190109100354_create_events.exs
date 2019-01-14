defmodule MyEvents.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :city, :string
      add :name, :string
      add :description, :string
      add :event_date, :date
      add :location, :string

      timestamps()
    end

  end
end
