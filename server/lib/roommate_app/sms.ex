defmodule RoommateApp.Sms do
  def sendSMS(%{"phone" => phone_number, "msg" => msg}) do
    IO.inspect([:sendSMS_phonenumber, phone_number])

    # https://www.twilio.com/docs/sms/api/message-resource#create-a-message-resource
    # specific formatting: https://github.com/edgurgel/httpoison/issues/109
    url =
      "https://api.twilio.com/2010-04-01/Accounts/AC1259ba576ff64b91a9c69fe487f7493e/Messages.json"

    to_number = phone_number
    messagingServiceSid = "MG7e76a0fbe7dd06db319d212769aa01ec"
    body = msg

    # redacted.
    encodedToken = "Basic " <> Base.encode64("<AccountSid>:<AuthToken>")

    b =
      HTTPoison.post(
        url,
        {:form, [To: to_number, MessagingServiceSid: messagingServiceSid, Body: body]},
        %{Authorization: encodedToken}
      )

    IO.inspect([:sendSMS_postresponse, b])
  end
end
