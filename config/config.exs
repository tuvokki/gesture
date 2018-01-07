# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gesture,
  ecto_repos: [Gesture.Repo]

# Configures the endpoint
config :gesture, GestureWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "S5wTr9d3q+M/vHLOVkRd/5PKDOXXzEQk1K5ZF9R8q9jcTB9ecWoKoaxtBt4TuG+7",
  render_errors: [view: GestureWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Gesture.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Adding json accept headers mime type
# config :mime, :types, %{
#   "application/json" => ["json"],
#   "application/xml" => ["xml"]
# }

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
