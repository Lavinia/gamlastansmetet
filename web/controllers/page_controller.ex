defmodule Gamlastansmetet.PageController do
  use Gamlastansmetet.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
