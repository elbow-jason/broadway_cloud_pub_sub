defmodule BroadwayCloudPubSub.MixProject do
  use Mix.Project

  @version "0.7.0"
  @description "A Google Cloud Pub/Sub connector for Broadway"
  @repo_url "https://github.com/dashbitco/broadway_cloud_pub_sub"

  def project do
    [
      app: :broadway_cloud_pub_sub,
      version: @version,
      elixir: "~> 1.7",
      elixirc_paths: elixirc_paths(Mix.env()),
      name: "BroadwayCloudPubSub",
      description: @description,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp deps do
    [
      {:broadway, "~> 1.0"},
      {:google_api_pub_sub, "~> 0.11"},
      {:hackney, "~> 1.6"},
      {:goth, "~> 1.0", optional: true},
      {:ex_doc, "~> 0.23", only: :docs},
      {:bypass, "~> 2.1", only: :test}
    ]
  end

  defp docs do
    [
      main: "BroadwayCloudPubSub.Producer",
      nest_modules_by_prefix: [BroadwayCloudPubSub],
      source_ref: "v#{@version}",
      source_url: @repo_url,
      extras: [
        "README.md",
        "CHANGELOG.md"
      ]
    ]
  end

  defp package do
    %{
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @repo_url}
    }
  end
end
