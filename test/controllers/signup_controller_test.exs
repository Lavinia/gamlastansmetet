defmodule Gamlastansmetet.SignupControllerTest do
  use Gamlastansmetet.ConnCase
  alias Gamlastansmetet.Signup

  test "GET /signup/new" do
    conn = get conn(), "/signup/new"
    assert conn.status == Plug.Conn.Status.code :ok
    assert conn.resp_body =~ "Anmälan 2015"
  end

  test "POST /signup" do
    signup_count = Signup.count
    conn = post conn(), "/signup", %{ "signup" => %{ "team_name" => "Kämpetorskarna", "phone" => "123-456789", "email" => "kämpe@torskar.na" } }
    assert conn.status == Plug.Conn.Status.code :created
    assert conn.resp_body =~ "Tack för att du anmält Kämpetorskarna"
    assert Signup.count == signup_count + 1
  end

  test "POST /signup without required params" do
    signup_count = Signup.count
    conn = post conn(), "/signup", %{ "signup" => %{ "phone" => "123-456789", "email" => "kämpe@torskar.na" } }
    assert conn.status == Plug.Conn.Status.code :ok
    assert conn.resp_body =~ "Anmälan 2015"
    assert Signup.count == signup_count
  end
end
