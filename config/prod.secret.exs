use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :my_events, MyEventsWeb.Endpoint,
  secret_key_base: "oIuKiT+1vAmDtvfoa0MGBtlnHabgaQAbIveEufAKeU22KEG8lC8ZpnIcnkMeCOar"

# Configure your database
config :my_events, MyEvents.Repo,
  username: "postgres",
  password: "postgres",
  database: "my_events_prod",
  pool_size: 15
