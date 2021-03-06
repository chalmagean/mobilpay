defmodule Mobilpay.Mixfile do
  use Mix.Project

  def project do
    [
      app: :mobilpay,
      name: "Mobilpay",
      version: "0.1.0",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: [
        maintainers: ["Cezar Halmagean"],
        licenses: ["MIT"],
        links: %{
          "GitHub" => "https://github.com/chalmagean/mobilpay"
        }
      ],
      description: """
      Elixir API client for Mobilpay (www.mobilpay.ro).
      """
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
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
