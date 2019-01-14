defmodule MyEvents.Repo.Migrations.AddLinkAndOrgid do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :link, :string
      add :organizer_id, references(:organizers)
    end
  end
end
