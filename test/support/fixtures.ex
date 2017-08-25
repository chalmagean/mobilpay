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

  def fixture(:xml_response, :confirmed) do
    xml_response(0)
  end

  def fixture(:xml_response, :failed) do
    xml_response(20, "Failed")
  end

  defp xml_response(error_code, error_message \\ "Confirmed") do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <order id="sometoken" timestamp="20161020121000" type="card">
      <signature>QBYU-2R39-F8H4-DD57-PRKG</signature>
      <invoice amount="11" currency="RON">
        <details>Payment Details</details>
        <contact_info>
          <billing type="person">
            <first_name>John</first_name>
            <last_name>Doe</last_name>
            <email>jdoe@example.com</email>
            <address>Str. 1</address>
            <mobile_phone>1234567890</mobile_phone>
          </billing>
        </contact_info>
      </invoice>
      <params>
        <name>param1Name</name>
        <value>param1Value</value>
      </params>
      <url>
        <confirm>myConfirmationUrl</confirm>
        <return>myReturnUrl</return>
      </url>
      <mobilpay timestamp="20161102165808" crc="eeb800365a2148ebbba9555cd79959fe">
        <action>action</action>
        <customer type="person">
          <first_name><![CDATA[John]]></first_name>
          <last_name><![CDATA[Doe]]></last_name>
          <address><![CDATA[Str.+1]]></address>
          <email><![CDATA[jdoe%40example.com]]></email>
          <mobile_phone><![CDATA[1234567890]]></mobile_phone>
        </customer>
        <purchase>406659</purchase>
        <original_amount>11</original_amount>
        <processed_amount>11</processed_amount>
        <current_payment_count>1</current_payment_count>
        <pan_masked>9****5098</pan_masked>
        <payment_instrument_id>15966</payment_instrument_id>
        <installments>1</installments>
        <error code="#{error_code}"><![CDATA[#{error_message}]]></error>
      </mobilpay>
    </order>
    """
  end

end
