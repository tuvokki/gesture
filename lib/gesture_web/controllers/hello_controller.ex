defmodule GestureWeb.HelloController do
  use GestureWeb, :controller

  def index(conn, _params) do
    # Note: Using an atom as the template name will also work here, render conn, :index,
    # but the template will be chosen based off the Accept headers, e.g. "index.html" or "index.json".
    render conn, "index.html"
  end

  def show(conn, %{"messenger" => messenger}) do
    # Note: If the body of the action needs access to the full map of parameters bound to the params
    # variable in addition to the bound messenger variable, we could define show/2 like this:

    # def show(conn, %{"messenger" => messenger} = params) do
    #   ...
    # end
    render conn, "show.html", messenger: messenger
  end

  def flashes(conn, _params) do
    # just testing the flashes
    conn
    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    |> put_flash(:error, "Let's pretend we have an error.")
    |> render("index.html")
  end
end