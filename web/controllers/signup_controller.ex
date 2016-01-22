defmodule Gamlastansmetet.SignupController do
  use Gamlastansmetet.Web, :controller
  alias Gamlastansmetet.Repo
  alias Gamlastansmetet.Signup
  alias Plug.Conn.Status

  def new(conn, _params) do
    render conn, "new.html", changeset: Signup.changeset(%Signup{})
  end

  def create(conn, params) do
    Signup.changeset(%Signup{}, params["signup"])
    |> Repo.insert
    |> respond_to_signup(conn)
  end

  defp respond_to_signup({:ok, signup}, conn) do
    conn
    |> put_status(Status.code(:created))
    |> render("show.html", signup: signup)
  end
  defp respond_to_signup({:error, changeset}, conn) do
    conn
    |> put_status(Status.code(:ok))
    |> render("new.html", changeset: changeset)
  end
end
