defmodule MyEventsWeb.EventController do
  use MyEventsWeb, :controller

  import Ecto.Query

  alias MyEvents.EventManager
  alias MyEvents.EventManager.Event
  alias MyEvents.Repo
  alias MyEvents.Organizer


  #def index(conn, _params) do
  #  events = EventManager.list_events()
  #  render(conn, "index.html", events: events)
  #end
  def index(conn, params) do
    events = Event
      |> order_by(desc: :event_date)
      |> Repo.paginate(params)
    render(conn, "index.html", events: events)
  end

  def future(conn, params) do
    #events = EventManager.list_events(:fut)
    today = Date.utc_today()
    events = Event
      |> where([e], e.event_date > ^today)
      |> order_by(desc: :event_date)
      |> Repo.paginate(params)
    render(conn, "index.html", events: events)
  end

  def previous(conn, params) do
    #events = EventManager.list_events(:prev)
    today = Date.utc_today()
    events = Event
      |> where([e], e.event_date <= ^today)
      |> order_by(desc: :event_date)
      |> Repo.paginate(params)
    render(conn, "index.html", events: events)
  end

  def new(conn, _params) do
    changeset = EventManager.change_event(%Event{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"event" => event_params}) do
    case EventManager.create_event(event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event created successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    event = EventManager.get_event!(id)
    require IEx
    IEx.pry
    org = Repo.get(Organizer, event.organizer_id)
    render(conn, "show.html", event: event, org: org)
  end

  def edit(conn, %{"id" => id}) do
    event = EventManager.get_event!(id)
    changeset = EventManager.change_event(event)
    render(conn, "edit.html", event: event, changeset: changeset)
  end

  def update(conn, %{"id" => id, "event" => event_params}) do
    event = EventManager.get_event!(id)

    case EventManager.update_event(event, event_params) do
      {:ok, event} ->
        conn
        |> put_flash(:info, "Event updated successfully.")
        |> redirect(to: Routes.event_path(conn, :show, event))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", event: event, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    event = EventManager.get_event!(id)
    {:ok, _event} = EventManager.delete_event(event)

    conn
    |> put_flash(:info, "Event deleted successfully.")
    |> redirect(to: Routes.event_path(conn, :index))
  end

end
