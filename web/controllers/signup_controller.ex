defmodule Gamlastansmetet.SignupController do
  use Gamlastansmetet.Web, :controller
  alias Gamlastansmetet.Repo
  alias Gamlastansmetet.Signup
  alias Plug.Conn.Status

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    {:ok, signup} = Signup.changeset(%Signup{}, params["signup"])
    |> Repo.insert

    conn
    |> put_status(Status.code(:created))
    |> render "show.html", signup: signup
  end
end
