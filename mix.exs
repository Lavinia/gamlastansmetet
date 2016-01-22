defmodule Gamlastansmetet.Mixfile do
  use Mix.Project

  def project do
    [app: :gamlastansmetet,
     version: "0.0.1",
     elixir: "~> 1.2",
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
    [
      :phoenix,
      :phoenix_html,
      :cowboy,
      :logger,
      :gettext,
      :phoenix_ecto,
      :postgrex
    ]
  end

  # Specifies which paths to compile per environment
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies
  #
  # Type `mix help deps` for examples and options
  defp deps do
    [
      {:phoenix, "~> 1.1"},
      {:phoenix_ecto, "~> 2.0"},
      {:phoenix_html, "~> 2.4"},
      {:phoenix_live_reload, "~> 1.0"},
      {:cowboy, "~> 1.0"},
      {:postgrex, "~> 0.11"},
      {:hound, "~> 0.8"},
      {:gettext, "~> 0.9"}
   ]
  end
end
