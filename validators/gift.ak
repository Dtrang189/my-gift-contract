use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/transaction.{OutputReference, Transaction}

// 1. Datum: Dữ liệu gắn liền với tài sản đang bị khóa.
// Ở đây, Datum chính là mã băm (Hash) của ví người nhận quà.
pub type Datum {
  receiver_hash: VerificationKeyHash,
}

// 2. Redeemer: Hành động của người dùng muốn mở khóa.
// Trong trường hợp này, hành động chỉ đơn giản là "Claim" (Đòi quà), không cần dữ liệu phức tạp.
pub type Redeemer {
  Claim
}

// 3. Validator: Logic chính để quyết định ĐÚNG hay SAI
validator gift {
  spend(
    datum: Option<Datum>,
    _redeemer: Redeemer,
    _own_ref: OutputReference,
    ctx: Transaction,
  ) {
    expect Some(d) = datum
    // Lấy danh sách những người đã ký vào giao dịch này
    let signatories = ctx.extra_signatories
    // Kiểm tra: Trong danh sách chữ ký, có chữ ký của người nhận (receiver_hash) không?
    list.has(signatories, d.receiver_hash)
  }

  else(_) {
    fail
  }
}
