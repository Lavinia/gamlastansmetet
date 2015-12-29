defmodule Gamlastansmetet.SignupView do
  import Gamlastansmetet.Gettext
  require Logger
  use Gamlastansmetet.Web, :view

  def csrf_token, do: Plug.CSRFProtection.get_csrf_token

  def translate(string) do
    Gettext.gettext(Gamlastansmetet.Gettext, string)
  end
end
