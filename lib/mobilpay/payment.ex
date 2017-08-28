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
    return_url: "",
  ]

  @type t :: %__MODULE__{}

  @doc """
  Returns the default Payment struct
  """
  @spec new() :: t
  def new(), do: %__MODULE__{}
end
