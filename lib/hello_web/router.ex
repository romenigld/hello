defmodule HelloWeb.Router do
  use HelloWeb, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug HelloWeb.Plugs.Locale, "en"
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HelloWeb do
    pipe_through :api

    # resources "/reviews", ReviewController
  end

  scope "/", HelloWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/testing", PageController, :testing

    resources "/users", UserController
    resources "/sessions", SessionController, only: [:new, :create, :delete],
                                              singleton: true

    # resources "/users", UserController do
    #   resources "/posts", PostController
    # end
    #
    # resources "/comments", CommentController, except: [:delete]
    # resources "/reviews", ReviewController
    # get "/images", ImageController, :index
  end

  # New route for redirects
   scope "/", HelloWeb do
     get "/redirect_test", HelloController, :redirect_test, as: :redirect_test
   end

   defp authenticate_user(conn, _) do
     case get_session(conn, :user_id) do
       nil ->
         conn
         |> Phoenix.Controller.put_flash(:error, "Login required")
         |> Phoenix.Controller.redirect(to: "/")
         |> halt()

       user_id ->
         assign(conn, :current_user, Hello.Accounts.get_user!(user_id))

      end
    end

    scope "/cms", HelloWeb.CMS, as: :cms do
      pipe_through [:browser, :authenticate_user]

      resources "/pages", PageController
    end
    
  # scope "/" do
  #   pipe_through [:authenticate_user, :ensure_admin]
  #   forward "/jobs", BackgroundJob.Plug, name: "Hello Phoenix"
  # end

  # scope "/", AnotherAppWeb do
  #   pipe_through :browser
  #
  #   resources "/posts", PostController
  # end
  #
  # scope "/admin", HelloWeb.Admin, as: :admin do
  #   pipe_through :browser
  #
  #   resources "/images",  ImageController
  #   resources "/reviews", ReviewController
  #   resources "/users",   UserController
  # end
  #
  # scope "/api", HelloWeb.Api, as: :api do
  #   pipe_through :api
  #
  #   scope "/v1", V1, as: :v1 do
  #     resources "/images",  ImageController
  #     resources "/reviews", ReviewController
  #     resources "/users",   UserController
  #   end
  # end

end
