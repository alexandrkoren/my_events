# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :my_events,
  ecto_repos: [MyEvents.Repo]

# Configures the endpoint
config :my_events, MyEventsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "RbywYUIGLVGUVy1QujliQ+lS/K+ojCOO7KBtcJn+CW0QhespUscI0IWQMA6Du8SZ",
  render_errors: [view: MyEventsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MyEvents.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures the Scrivener.HTML
config :scrivener_html,
  routes_helper: MyApp.Router.Helpers,
  # If you use a single view style everywhere, you can configure it here. See View Styles below for more info.
  view_style: :bootstrap

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
