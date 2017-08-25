defmodule Mobilpay.ResponseTest do
  use ExUnit.Case
  import Mobilpay.Fixtures

  alias Mobilpay.Response

  test "parse/1 confirmed" do
    xml = fixture(:xml_response, :confirmed)
    assert Response.parse(xml) == {:ok, "sometoken"}
  end

  test "parse/1 failed" do
    xml = fixture(:xml_response, :failed)
    assert Response.parse(xml) == {:error, 20, "Failed", "sometoken"}
  end
end

