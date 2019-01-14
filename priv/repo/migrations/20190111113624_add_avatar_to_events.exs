defmodule MyEvents.Repo.Migrations.AddAvatarToEvents do
  use Ecto.Migration

  def change do
    alter table(:events) do
      add :image, :string
    end
  end

end
