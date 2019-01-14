defmodule MyEventsWeb.Router do
  use MyEventsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyEventsWeb do
    pipe_through :browser
    get "/", PageController, :index
    get "/events/future", EventController, :future
    get "/events/previous", EventController, :previous
    resources "/events", EventController
  end


  # Other scopes may use custom stacks.
  # scope "/api", MyEventsWeb do
  #   pipe_through :api
  # end
end
