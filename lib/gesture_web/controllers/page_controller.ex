defmodule GestureWeb.PageController do
  use GestureWeb, :controller
  alias Gesture.Events

  def index(conn, _params) do
    # render conn, "index.html"
    # first fetch events then use them in index.html
    events = Events.list_future_events()

    render(conn, "index.html", events: events)
  end
end