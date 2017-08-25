defmodule Mobilpay.PaymentTest do
  use ExUnit.Case

  alias Mobilpay.Payment

  test "changeset/2 validates email format" do
    changeset = Payment.changeset(%Payment{}, %{email: "foo"})
    refute changeset.valid?
    assert Keyword.has_key?(changeset.errors, :email)
  end

  test "changeset/2 validates type set" do
    changeset = Payment.changeset(%Payment{}, %{type: "foo"})
    refute changeset.valid?
    assert Keyword.has_key?(changeset.errors, :type)
  end
end
