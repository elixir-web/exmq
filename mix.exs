defmodule Exmq.Mixfile do
  use Mix.Project

  def project do
    [ app: :exmq,
      version: "0.0.1",
      elixir: "~> 0.12.3-dev",
      deps: deps ]
  end
  
  def application do
    [mod: { Exmq, [] }]
  end

  defp deps do
    [
      {:eredis, github: "wooga/eredis"}
    ]
  end
end
