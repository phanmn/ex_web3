defmodule ExWeb3.WalletTest do
  use ExUnit.Case

  describe "validate_message?" do
    test "true" do
      account = "0x63f9a92d8d61b48a9fff8d58080425a3012d05c8"
      message = "0x63f9a92d8d61b48a9fff8d58080425a3012d05c8igwyk4r1o7o"

      signature =
        "382a3e04daf88f322730f6a2972475fc5646ea8c4a7f3b5e83a90b10ba08a7364cd2f55348f2b6d210fbed7fc485abf19ecb2f3967e410d6349dd7dd1d4487751b"

      assert true == ExWeb3.Wallet.validate_message?(account, message, signature)
    end
  end
end
