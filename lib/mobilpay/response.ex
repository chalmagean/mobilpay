defmodule Mobilpay.Response do
  @moduledoc """
  Parses the XML response from the Mobilpay API
  """
  import SweetXml

  @spec parse(String.t) :: {atom, String.t} | {atom, String.t, String.t, String.t}
  def parse(xml) do
    result = parse_xml(xml)

    case result do
      %{code: 0} -> {:ok, result.token}
      %{code: errorCode, msg: msg} -> {:error, errorCode, to_string(msg), result.token}
    end
  end

  defp parse_xml(xml) do
    xml
    |> xpath(
      ~x"//order"e,
      code: ~x"./mobilpay/error/@code"i,
      msg: ~x"./mobilpay/error/text()",
      token: ~x"./@id"s
    )
  end
end
