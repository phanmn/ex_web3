defmodule ExWeb3.Wallet do
  def validate_message?(account, message, signature) do
    account
    |> ExWeb3.NativeWallet.validate_message(message, signature)
  end
end
