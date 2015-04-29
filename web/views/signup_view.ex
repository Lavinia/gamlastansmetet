defmodule Gamlastansmetet.SignupView do
  use Gamlastansmetet.Web, :view

  def csrf_token, do: Plug.CSRFProtection.get_csrf_token
end
