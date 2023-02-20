use anyhow::Result;
use web3::signing::{keccak256, recover};

#[rustler::nif]
fn verify_message(account: String, message: String, signature: String) -> bool {
    match verify_message_p(account, message, signature) {
        Ok(b) => b,
        Err(_err) => return false,
    }
}

fn verify_message_p(account: String, message: String, signature: String) -> Result<bool> {
    let eth_message = eth_message(message);
    let decoded_signature = hex::decode(signature.trim_start_matches("0x"))?;
    let pubkey = recover(&eth_message, &decoded_signature[..64], 0)?;
    let pubkey = format!("{:02X?}", pubkey);
    Ok(account == pubkey)
}

pub fn eth_message(message: String) -> [u8; 32] {
    keccak256(
        format!(
            "{}{}{}",
            "\x19Ethereum Signed Message:\n",
            message.len(),
            message
        )
        .as_bytes(),
    )
}

rustler::init!("Elixir.ExWeb3.NativeWallet", [verify_message]);
