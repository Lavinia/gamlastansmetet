defmodule Gamlastansmetet.SignupController do
  use Gamlastansmetet.Web, :controller
  alias Plug.Conn.Status

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    IO.inspect params
    conn
    |> put_status(Status.code(:created))
    |> render "show.html"
  end
end
