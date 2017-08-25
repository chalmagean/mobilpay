defmodule Mobilpay.PaymentRequestTest do
  use ExUnit.Case
  import Mobilpay.Fixtures
  import SweetXml

  alias Mobilpay.Request

  test "create/2 wraps a Payment struct in XML" do
    payment = fixture(:payment)
    request = Request.create(payment)

    order = request |> xpath(~x"//order")
    assert order |> xpath(~x"./signature/text()"s) == "1234-1234-1234-1234-1234"

    invoice = order |> xpath(~x"//order/invoice")
    assert invoice |> xpath(~x"./details/text()"s) == "Payment Details"

    contact = invoice |> xpath(~x"./contact_info/billing")
    assert contact |> xpath(~x"./@type"s) == "person"
    assert contact |> xpath(~x"./email/text()"s) == "jdoe@example.com"
    assert contact |> xpath(~x"./address/text()"s) == "Str. 1"
    assert contact |> xpath(~x"./mobile_phone/text()"s) == "1234567890"

    params = order |> xpath(~x"./params")
    assert params |> xpath(~x"./name/text()"s) == "token"
    assert params |> xpath(~x"./value/text()"s) == "sometoken"

    url = order |> xpath(~x"./url")
    assert url |> xpath(~x"./confirm/text()"s) == "https://example.com/confirm"
    assert url |> xpath(~x"./return/text()"s) == "https://example.com/return"
  end
end

