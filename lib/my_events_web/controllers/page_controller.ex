defmodule MyEventsWeb.PageController do
  use MyEventsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
