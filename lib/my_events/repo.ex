defmodule MyEvents.Repo do
  use Ecto.Repo,
    otp_app: :my_events,
    adapter: Ecto.Adapters.Postgres
  use Scrivener, page_size: 5
end
