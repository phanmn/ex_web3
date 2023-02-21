use std::str::FromStr;
use anyhow::Result;
use ethers::prelude::{Address, Signature};

#[rustler::nif]
fn validate_message(account: String, message: String, signature: String) -> bool {
    match validate_message_p(account, message, signature) {
        Ok(b) => b,
        Err(_err) => return false,
    }
}

fn validate_message_p(address_str: String, message: String, signature_str: String) -> Result<bool> {
    let address = Address::from_str(&address_str.trim_start_matches("0x"))?;
    let signature = Signature::from_str(&signature_str.trim_start_matches("0x"))?;
    let pubkey = signature.recover(message)?;
    Ok(address == pubkey)
}

rustler::init!("Elixir.ExWeb3.NativeWallet", [validate_message]);
