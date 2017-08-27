defmodule Mobilpay.Fixtures do
  alias Mobilpay.Payment

  def fixture(:payment) do
    %Payment{
      signature: "1234-1234-1234-1234-1234",
      amount: "11.11",
      currency: "EUR",
      timezone: "Europe/Bucharest",
      token: "sometoken",
      email: "jdoe@example.com",
      type: "person",
      first_name: "John",
      last_name: "Doe",
      address: "Str. 1",
      mobile_phone: "1234567890",
      confirm_url: "https://example.com/confirm",
      return_url: "https://example.com/return"
    }
  end
end
