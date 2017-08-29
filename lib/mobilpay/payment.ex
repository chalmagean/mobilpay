defmodule Mobilpay.Payment do
  defstruct [
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
    return_url: ""
  ]
end
