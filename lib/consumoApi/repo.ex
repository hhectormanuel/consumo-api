defmodule ConsumoApi.Repo do
  use Ecto.Repo,
    otp_app: :consumoApi,
    adapter: Ecto.Adapters.Postgres
end
