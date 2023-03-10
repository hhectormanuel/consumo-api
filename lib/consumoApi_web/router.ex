defmodule ConsumoApiWeb.Router do
  use ConsumoApiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ConsumoApiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api
    forward "", Absinthe.Plug.GraphiQL,
    schema: ConsumoApiWeb.Schema.AbsintheSmsVoiceData,
    interface: :simple,
    context: %{pubsub: ConsumoApiWeb.Endpoint}
  end

  # scope "/", ConsumoApiWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  #   live "/consumo", Index
  # end

  # Other scopes may use custom stacks.
  scope "/api2", ConsumoApiWeb do
    pipe_through :api

    # resources "/items", ItemController, only: [:index, :show]
    # get "/url", ItemController, :url
    post "/url", ItemController, :url_post
    # get "/file", ItemController, :file
    post "/file", ItemController, :file_post
    get "/file", ItemController, :file_get
    get "/file_test", ItemController, :file_get_test
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: ConsumoApiWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
