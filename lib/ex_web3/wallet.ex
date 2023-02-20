defmodule ExWeb3.Wallet do
  defdelegate validate_message?(account, message, signature), to: ExWeb3.NativeWallet, as: :validate_message
end
