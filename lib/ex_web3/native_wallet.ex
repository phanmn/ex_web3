defmodule ExWeb3.NativeWallet do
  use Rustler, otp_app: :ex_web3, crate: :wallet

  def verify_message(_, _, _), do: error()

  defp error, do: :erlang.nif_error(:nif_not_loaded)
end
