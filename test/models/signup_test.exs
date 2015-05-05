defmodule Gamlastansmetet.SignupTest do
  use ExUnit.Case
  alias Gamlastansmetet.Signup

  test "changeset is not valid when team name is missing" do
    changeset = Signup.changeset(%Signup{}, %{"email" => "kämpe@torskar.na"})
    refute changeset.valid?
  end

  test "changeset is not valid when the team name is blank" do
    changeset = Signup.changeset(%Signup{}, %{"team_name" => "", "phone" => "123-456789" })
    refute changeset.valid?
  end

  test "changeset is not valid without a phone or email" do
    changeset = Signup.changeset(%Signup{}, %{"team_name" => "Kämpetorskarna"})
    refute changeset.valid?
  end

  test "changeset is valid with team name and phone" do
    params = %{"team_name" => "Kämpetorskarna", "phone" => "123-456789"}
    changeset = Signup.changeset(%Signup{}, params)
    assert changeset.valid?
  end
  #test "changeset is valid with team name and email"
end
