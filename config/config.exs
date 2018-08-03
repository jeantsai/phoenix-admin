# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :admin,
  ecto_repos: [Admin.Repo]

# Configures the endpoint
config :admin, AdminWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "VlzStuEqwEgpFsnj+UqPlgJQFszQaDr9eA/cZq+wWNm5URbFxCTQJODO0XHMcOy5",
  render_errors: [view: AdminWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Admin.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason

# Configures Guardian for authetication
config :admin, Admin.Auth.Guardian,
  issuer: "jeantsai.admin",
  secret_key: "4zIgZclCilUrQqdJJ52Bhtvw531W8j8Mdk+Fbq5h7j8Ae8RFEoDNF6HVehdJMKzI"


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
