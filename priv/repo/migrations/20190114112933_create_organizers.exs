defmodule MyEvents.Repo.Migrations.CreateOrganizers do
  use Ecto.Migration

  def change do
    create table(:organizers) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
