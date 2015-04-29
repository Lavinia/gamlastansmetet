defmodule Gamlastansmetet.SignupControllerTest do
  use Gamlastansmetet.ConnCase

  test "GET /signup/new" do
    conn = get conn(), "/signup/new"
    assert conn.status == Plug.Conn.Status.code :ok
    assert conn.resp_body =~ "Anmälan 2015"
  end

  test "POST /signup" do
    conn = post conn(), "/signup", %{ team_name: "Storfiskarna" }
    assert conn.status == Plug.Conn.Status.code :created
    assert conn.resp_body =~ "Tack för att du anmält Storfiskarna"
  end
end
