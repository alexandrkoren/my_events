defmodule MyEvents.Organizer do
  use Ecto.Schema
  import Ecto.Changeset


  schema "organizers" do
    field :description, :string
    field :name, :string
    has_many :events, MyEvents.EventManager.Event

    timestamps()
  end

  @doc false
  def changeset(organizer, attrs) do
    organizer
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
