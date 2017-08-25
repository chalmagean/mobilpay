defmodule Mobilpay.Payment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "payment" do
    field :signature
    field :amount, :integer
    field :currency, :float, default: 0.0
    field :timezone
    field :token
    field :email
    field :type
    field :first_name
    field :last_name
    field :address
    field :mobile_phone
    field :confirm_url
    field :return_url
  end

  def changeset(payment, params \\ %{}) do
    payment
    |> cast(params, [:signature, :amount, :currency, :timezone, :token, :email, :type, :first_name, :last_name, :address, :mobile_phone, :confirm_url, :return_url])
    |> validate_required([:signature, :amount, :currency, :token, :email, :type, :confirm_url, :return_url])
    |> validate_format(:email, ~r/@/)
    |> validate_inclusion(:type, ["company", "person"])
  end
end
