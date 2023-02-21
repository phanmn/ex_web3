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

    test "Prefix signature" do
      account = "0xff04a32e264e9405a38938ee4966e0ae4f16a703"
      message = "979986"

      signature =
        "0x1badaa6fa9e50565ed2aedcb7300dfea879c1d41e82f6ed426551011626e275a53cddfd35025b8d431eca3960d6b27365ff446e09e109910dbc31c1d2dc1b54f1b"

      assert true == ExWeb3.Wallet.validate_message?(account, message, signature)
    end

    test "true 2" do
      account = "0xff04a32e264e9405a38938ee4966e0ae4f16a703"
      message = "000632"

      signature =
        "0x0f0d835f8f1fce0e082eaa6bafbf7e7da860824b6abb94846c8b0785509e5d1d101a0cf885b0b0c99d35ed191874f6db5c5377f055084a0e38e99710601ecc9d1c"

      assert true == ExWeb3.Wallet.validate_message?(account, message, signature)
    end
  end
end
