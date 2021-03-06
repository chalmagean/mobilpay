defmodule Mobilpay.ResponseTest do
  use ExUnit.Case
  alias Mobilpay.Response

  test "parse/1 confirmed" do
    response =
      :code.priv_dir(:mobilpay)
      |> Path.join("response_confirmed.xml")
      |> File.read!
      |> Response.parse

    assert response == {:ok, "sometoken"}
  end

  test "parse/1 failed" do
    response =
      :code.priv_dir(:mobilpay)
      |> Path.join("response_insuficient_funds.xml")
      |> File.read!
      |> Response.parse

    assert response == {:error, 20, "Insuficient Funds", "sometoken"}
  end
end
