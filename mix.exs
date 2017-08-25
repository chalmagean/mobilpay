defmodule Mobilpay.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mobilpay,
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :timex]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:xml_builder, "~> 0.1.1"},
      {:sweet_xml, "~> 0.6"},
      {:timex, "~> 3.1"},
      {:ecto, "~> 2.2"}
    ]
  end
end
