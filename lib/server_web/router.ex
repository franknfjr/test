defmodule ServerWeb.Router do
  use ServerWeb, :router

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

  scope "/api/v1", ServerWeb do
    #GET é utilizado para consultar
    #POST é utilizado para inserir
    #PUT é utilizado para atualizar
    #DELETE é utilizado para deletar
    pipe_through :browser # Use the default browser stack

    get "/channels", ChannelController, :index

    resources "/messages", MessageController, except: [:new, :edit]
    resources "/channel_users", ChannelUserController, only: [:create]
    get "/users", UserController, :index

  end

  # Other scopes may use custom stacks.
  # scope "/api", ServerWeb do
  #   pipe_through :api
  # end
end
