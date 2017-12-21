defmodule ServerWeb.UserPresence do
  use Phoenix.Presence, otp_app: :server,
                        pubsub_server: ServerWeb.PubSub
end
