defmodule Server.MixProject do
  use Mix.Project

  def project do
    [
      app: :server,
      version: "0.1.0",
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Server.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.5.7"},
      {:phoenix_html, "~> 2.11"},
      {:phoenix_live_reload, "~> 1.2", only: :dev},
      {:phoenix_live_dashboard, "~> 0.4.0"},
      {:telemetry_metrics, "~> 0.4"},
      {:telemetry_poller, "~> 0.4"},
      {:cachex, "~> 3.3.0"},
      {:configparser_ex, "~> 4.0.0"},
      {:enum_type, "~> 1.1.3"},
      {:ex_crypto, "~> 0.10.0"},
      {:floki, "~> 0.29.0"},
      {:google_api_drive, "~> 0.20.4"},
      {:goth, "~> 1.2.0"},
      {:jason, "~> 1.0"},
      {:kadabra, "~> 0.4.4"},
      {:mock, "~> 0.3.6", only: :test},
      {:mongodb_driver, "~> 0.7.1"},
      {:pigeon, "~> 1.6.0"},
      {:plug_cowboy, "~> 2.0"},
      {:recase, "~> 0.5"},
      {:tesla, "~> 1.4.0"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "cmd npm install --prefix assets"]
    ]
  end
end
