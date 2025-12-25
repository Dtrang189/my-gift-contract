// Import các thư viện cần thiết từ Aiken Standard Library (stdlib)
use aiken/collection/list
use aiken/crypto.{VerificationKeyHash}
use cardano/transaction.{OutputReference, Transaction}

// ----------------------------------------------------------------------------
// 1. Datum: Dữ liệu được lưu trữ trực tiếp trên UTxO (tài sản đang bị khóa).
// Trong bài toán này, Datum chứa mã băm (Hash) của ví người nhận. 
// Chỉ người có ví tương ứng với mã băm này mới có quyền mở khóa.
// ----------------------------------------------------------------------------
pub type Datum {
  receiver_hash: VerificationKeyHash,
}

// ----------------------------------------------------------------------------
// 2. Redeemer: Dữ liệu do người muốn mở khóa cung cấp khi thực hiện giao dịch.
// Ở đây chúng ta chỉ dùng một hành động đơn giản là "Claim" (Đòi quà).
// Không cần truyền thêm thông tin gì phức tạp trong Redeemer này.
// ----------------------------------------------------------------------------
pub type Redeemer {
  Claim
}

// ----------------------------------------------------------------------------
// 3. Validator: Chứa logic kiểm soát việc chi tiêu (spending) tài sản.
// Tên validator là "gift".
// ----------------------------------------------------------------------------
validator gift {
  // Hàm 'spend' được gọi khi ai đó cố gắng rút tài sản từ địa chỉ của script này.
  spend(
    datum: Option<Datum>,
    // Dữ liệu đính kèm với tài sản đang bị khóa
    _redeemer: Redeemer,
    // Hành động của người rút (không dùng nên thêm dấu _)
    _own_ref: OutputReference,
    // Tham chiếu đến chính UTxO đang được chi tiêu
    ctx: Transaction,
  ) {
    // Thông tin toàn bộ giao dịch hiện tại (người ký, input, output...)
    // 'expect' là cách Aiken kiểm tra một điều kiện bắt buộc.
    // Dòng dưới nghĩa là: "Tôi mong đợi datum phải tồn tại (Some)".
    // Nếu có, lấy giá trị bên trong gán vào biến 'd'. 
    // Nếu không có (None), giao dịch sẽ thất bại ngay lập tức tại đây.
    expect Some(d) = datum

    // Bước 1: Trích xuất danh sách tất cả các mã băm (hash) của những người đã ký vào giao dịch này.
    let signatories = ctx.extra_signatories

    // Bước 2: Kiểm tra xem trong danh sách chữ ký (signatories), 
    // có tồn tại mã băm của người được chỉ định nhận quà (d.receiver_hash) hay không.
    // Hàm list.has trả về True nếu tìm thấy, False nếu không.
    list.has(signatories, d.receiver_hash)
  }

  // Các mục đích khác (mint, withdraw...) mặc định sẽ thất bại.
  else(_) {
    fail
  }
}

// ============================================================================
// UNIT TESTS: Các kịch bản kiểm thử để đảm bảo code chạy đúng mà không cần lên mạng thật.
// ============================================================================

// Trường hợp THÀNH CÔNG: Người ký giao dịch đúng là người nhận quà.
test gift_success() {
  // 1. Giả lập một mã băm ví người nhận (20 bytes hex).
  let receiver_hash = "face"
  let datum = Datum { receiver_hash }
  // 2. Giả lập một giao dịch (Context) mà trong đó 'extra_signatories' chứa đúng mã băm người nhận.
  let ctx =
    Transaction {
      ..transaction.placeholder,
      extra_signatories: [receiver_hash],
    }

  // 3. Tạo một tham chiếu UTxO giả.
  let mock_utxo_ref = OutputReference { transaction_id: "00", output_index: 0 }

  // 4. Thực thi hàm spend và mong đợi kết quả trả về là True.
  gift.spend(Some(datum), Claim, mock_utxo_ref, ctx)
}

// Trường hợp THẤT BẠI: Người ký giao dịch không phải người nhận.
test gift_fail() {
  // 1. Người nhận vẫn là "face".
  let receiver_hash = "face"
  let datum = Datum { receiver_hash }
  // 2. Nhưng người ký giao dịch lại là một mã băm khác ("abcd").
  let ctx =
    Transaction { ..transaction.placeholder, extra_signatories: ["abcd"] }
  let mock_utxo_ref = OutputReference { transaction_id: "00", output_index: 0 }

  // 3. Thực thi và mong đợi kết quả là False (dấu ! phủ định kết quả).
  !gift.spend(Some(datum), Claim, mock_utxo_ref, ctx)
}
