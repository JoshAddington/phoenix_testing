defmodule Rocks.PageController do
  use Rocks.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
