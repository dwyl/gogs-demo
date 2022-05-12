import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :app, AppWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "INmIAgZE+gdWoGvC7SHknr+Np2awtjq011oNK+Y6ux8MO8pZ2hrXgyau4n2n9EVw",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime


config :gogs, mock: true