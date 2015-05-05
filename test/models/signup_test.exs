defmodule Gamlastansmetet.SignupTest do
  use ExUnit.Case
  alias Gamlastansmetet.Signup

  test "changeset is not valid when team name is missing" do
    changeset = Signup.changeset(%Signup{}, %{})
    refute changeset.valid?
  end

  test "changeset is not valid when the team name is blank" do
    changeset = Signup.changeset(%Signup{}, %{"team_name" => ""})
    refute changeset.valid?
  end
end
