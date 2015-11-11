defmodule SignupFeatureTest do
  use ExUnit.Case
  use Hound.Helpers

  # Start hound session and destroy when tests are run
  hound_session

  # If you prefer to manually start and end sessions,
  # use Hound.start_session and Hound.end_session in
  # the setup and teardown blocks of your tests.

  test "displaying error messages" do
    new_signup_url = "/signup/new"
    navigate_to new_signup_url

    fill_field {:id, "signup_team_name"}, "Metmaskarna"
    click {:id, "create_signup"}

    actual = visible_text({:id, "phone_error_message"})
    expected_error_message = "antingen telefon eller email måste fyllas i"

    assert actual == expected_error_message
  end
end
