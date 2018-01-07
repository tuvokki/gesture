defmodule GestureWeb.Router do
  use GestureWeb, :router

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

  scope "/", GestureWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/hello/flashes", HelloController, :flashes
    get "/hello/:messenger", HelloController, :show
    # Commented out because this route was picked up by tests which shoud be routed through the api
    # TODO: handle the user-views by a UserViewController
    # resources "/users", UserController
    resources "/posts", PostController, only: [:index, :show]
    resources "/comments", CommentController, except: [:delete]

    # This means that the plugs in the authenticate_user and ensure_admin pipelines will be called
    # before the BackgroundJob.Plug allowing them to send an appropriate response and call halt() .
    # pipe_through [:authenticate_user, :ensure_admin]
    # forward "/jobs", BackgroundJob.Plug
    # The opts that are passed to the init/1 callback of a Plug can be passed as a 3rd argument.
    # For example, maybe the background job page lets you set the name of your application to be
    # displayed on the page. This could be passed with:
    # forward "/jobs", BackgroundJob.Plug, name: "Hello Phoenix"
  end

  # This means that all routes starting with /jobs will be sent to the BackgroundJob.Plug module.
  forward "/jobs", BackgroundJob.Plug

  # Other scopes may use custom stacks.
  scope "/api", GestureWeb do
    pipe_through :api

    resources "/users", UserController, except: [:new, :edit]
  end
end
