defmodule MyEvents.EventManager.Event do
  use Ecto.Schema
  use Arc.Ecto.Schema
  import Ecto.Changeset


  schema "events" do
    field :city, :string
    field :description, :string
    field :event_date, :date
    field :location, :string
    field :name, :string
    field :image, MyEvents.ImageUploader.Type
    field :link, :string
    belongs_to :organizer, MyEvents.Organizer

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:city, :name, :description, :event_date, :location, :image, :organizer_id])
    |> cast_attachments(attrs, [:image])
    |> validate_required([:city, :name, :description, :event_date, :location, :image])
  end
end
