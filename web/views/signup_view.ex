defmodule Gamlastansmetet.SignupView do
  use Gamlastansmetet.Web, :view

  def csrf_token(conn) do
    Plug.CSRFProtection.get_csrf_token
  end
end
