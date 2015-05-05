defmodule Gamlastansmetet.SignupController do
  use Gamlastansmetet.Web, :controller
  alias Gamlastansmetet.Repo
  alias Gamlastansmetet.Signup
  alias Plug.Conn.Status

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    signup = Signup.changeset(%Signup{}, params["signup"])
    |> Repo.insert

    conn
    |> put_status(Status.code(:created))
    |> render "show.html", signup: signup
  end
end
