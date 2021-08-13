defmodule TerrMan.Repo do
  use Ecto.Repo,
    otp_app: :terr_man,
    adapter: Ecto.Adapters.Postgres
end
