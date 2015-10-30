defmodule Gamlastansmetet.SignupTest do
  use ExUnit.Case
  alias Gamlastansmetet.Signup

  test "changeset is not valid when team name is missing" do
    params = %{"email" => "kämpe@torskar.na"}
    refute changeset_for(params).valid?
  end

  test "changeset is not valid when the team name is blank" do
    params = %{"team_name" => "", "phone" => "123-456789"}
    refute changeset_for(params).valid?
  end

  test "changeset is not valid without a phone or email" do
    params = %{"team_name" => "Kämpetorskarna"}
    refute changeset_for(params).valid?
  end

  test "changeset is valid with team name and phone" do
    params = %{"team_name" => "Kämpetorskarna", "phone" => "123-456789"}
    assert changeset_for(params).valid?
  end

  test "changeset is valid with team name and email" do
    params = %{"team_name" => "Torsksimmarna", "email" => "torskar@simmar.se"}
    assert changeset_for(params).valid?
  end

  def changeset_for(params) do
    Signup.changeset(%Signup{}, params)
  end
end
