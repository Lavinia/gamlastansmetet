defmodule Gamlastansmetet.SignupController do
  use Gamlastansmetet.Web, :controller
  alias Gamlastansmetet.Repo
  alias Gamlastansmetet.Signup
  alias Plug.Conn.Status

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, params) do
    changeset = Signup.changeset(%Signup{}, params["signup"])

    {status, signup_or_changeset} = changeset |> Repo.insert
    if status == :ok do
      conn
      |> put_status(Status.code(:created))
      |> render "show.html", signup: signup_or_changeset
    else
      conn
      |> put_status(Status.code(:ok))
      |> render "new.html"
    end
  end
end
