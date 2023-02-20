defmodule ExWeb3.NativeWallet do
  @moduledoc false
  use Rustler, otp_app: :ex_web3, crate: :wallet

  def validate_message(_, _, _), do: error()

  defp error, do: :erlang.nif_error(:nif_not_loaded)
end
