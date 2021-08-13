defmodule TerrManWeb.PageController do
  use TerrManWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
