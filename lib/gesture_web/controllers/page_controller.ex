defmodule GestureWeb.PageController do
  use GestureWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
