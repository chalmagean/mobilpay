defmodule Mobilpay.Request do
  @moduledoc """
  It builds the XML required by the Mobilpay API
  """
  import XmlBuilder

  alias Mobilpay.Payment

  def create(%Payment{} = payment) do
    datetime = Timex.now
    timestamp = Timex.format!(datetime, "%Y%m%d%H%M", :strftime)

    xml =
      element(:order, %{type: "card", id: payment.token, timestamp: timestamp}, [
        element(:signature, payment.signature),
        element(:invoice, %{currency: payment.currency, amount: payment.amount}, [
          element(:details, "Payment Details"),
          element(:contact_info, [
            element(:billing, %{type: payment.type}, [
              element(:email, payment.email),
              element(:address, payment.address),
              element(:mobile_phone, payment.mobile_phone),
            ])
          ])
        ]),
        element(:params, [
          element(:name, "token"),
          element(:value, payment.token)
        ]),
        element(:url, [
          element(:confirm, payment.confirm_url),
          element(:return, payment.return_url)
        ])
      ])

    XmlBuilder.doc(xml)
  end
end
