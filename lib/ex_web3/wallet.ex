defmodule ExWeb3.Wallet do
  @spec validate_message?(bitstring(), bitstring(), bitstring()) :: boolean()
  defdelegate validate_message?(account, message, signature), to: ExWeb3.NativeWallet, as: :validate_message
end
