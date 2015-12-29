defmodule Gamlastansmetet.Mixfile do
  use Mix.Project

  def project do
    [app: :gamlastansmetet,
     version: "0.0.1",
     elixir: "~> 1.1",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [
      mod: {Gamlastansmetet, []},
      applications: applications_for(Mix.env)
    ]
  end

  defp applications_for(:test), do: [:hound | default_applications]
  defp applications_for(_), do: default_applications

  defp default_applications do
    [:gettext, :phoenix, :cowboy, :logger, :ecto]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 1.0"},
      {:phoenix_ecto, "~> 1.2"},
      {:phoenix_html, "~> 2.2"},
      {:phoenix_live_reload, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      {:postgrex, "~> 0.9"},
      {:hound, "~> 0.7.5"},
      {:gettext, "~> 0.9"}
   ]
  end
end
