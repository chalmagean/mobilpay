defmodule Mobilpay.PaymentTest do
  use ExUnit.Case

  alias Mobilpay.Payment

  test "new/0 returns a default struct" do
    assert Payment.new() == %Payment{
      signature: "",
      amount: "",
      currency: "RON",
      timezone: "Europe/Bucharest",
      token: "",
      email: "",
      type: "person",
      first_name: "",
      last_name: "",
      address: "",
      mobile_phone: "",
      confirm_url: "",
      return_url: "",
    }
  end
end
