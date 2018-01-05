defmodule GestureWeb.HelloControllerTest do
  use GestureWeb.ConnCase

  test "GET /hello", %{conn: conn} do
    conn = get conn, "/hello"
    assert html_response(conn, 200) =~ "Hello World, from Phoenix!"
  end

  test "GET /hello/Frank", %{conn: conn} do
    conn = get conn, "/hello/Frank"
    assert html_response(conn, 200) =~ "Hello World, from Frank!"
  end

  test "GET /hello/Theo", %{conn: conn} do
    conn = get conn, "/hello/Theo"
    assert html_response(conn, 200) =~ "Hello World, from Theo!"
  end
end
