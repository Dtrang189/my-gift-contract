# 02. The Validator Trio: Datum, Redeemer, Context (Bộ ba Validator)

---

## 🇻🇳 Tiếng Việt

Một Validator (như `gift.ak`) luôn nhận vào 3 tham số để quyết định có cho phép tiêu tiền hay không. Đây là khái niệm cốt lõi của Cardano.

### 1. Datum (Dữ liệu khóa)

- **Là gì**: Một mảnh dữ liệu nhỏ được gắn chặt với UTxO khi tiền _được gửi vào_ contract.
- **Vai trò**: Nó mô tả _trạng thái_ hoặc _chủ sở hữu_ của số tiền đó.
- **Trong Gift Contract**: `Datum` chính là mã băm (Hash) của người được nhận quà. Nó giống như việc viết tên người nhận lên gói quà vậy.

### 2. Redeemer (Hành động mở khóa)

- **Là gì**: Dữ liệu mà người dùng cung cấp khi họ _muốn rút tiền ra_.
- **Vai trò**: Nó giải thích _lý do_ hoặc _cách thức_ họ muốn mở khóa.
- **Trong Gift Contract**: `Redeemer` chỉ đơn giản là hành động `Claim` (Tôi muốn nhận quà).

### 3. ScriptContext (Bối cảnh giao dịch)

- **Là gì**: Toàn bộ thông tin về giao dịch đang diễn ra.
- **Bao gồm**: Ai đang ký tên? Tiền vào là gì? Tiền ra đi đâu? Thời gian giao dịch?
- **Vai trò**: Giúp Validator kiểm tra xem những gì người dùng làm có khớp với `Datum` không.
- **Trong Gift Contract**: Chúng ta dùng Context để kiểm tra danh sách chữ ký (`extra_signatories`). Nếu người ký trùng khớp với người ghi trong `Datum`, Validator trả về `True` (Mở khóa!).

---

## 🇺🇸 English

A Validator (like `gift.ak`) always takes 3 arguments to decide whether to allow spending funds. This is a core concept of Cardano.

### 1. Datum (Locking Data)

- **What**: A small piece of data attached to the UTxO when funds are _sent to_ the contract.
- **Role**: Describes the _state_ or _owner_ of those funds.
- **In Gift Contract**: The `Datum` is the Policy Key Hash (Hash) of the intended recipient. It's like writing the receiver's name on a gift box.

### 2. Redeemer (Unlocking Action)

- **What**: Data provided by the user when they _want to withdraw funds_.
- **Role**: Explains _why_ or _how_ they are unlocking it.
- **In Gift Contract**: The `Redeemer` is simply the `Claim` action.

### 3. ScriptContext (Transaction Context)

- **What**: Comprehensive information about the transaction currently taking place.
- **Includes**: Who signed it? Inputs? Outputs? Time range?
- **Role**: Allows the Validator to cross-check user actions against the `Datum`.
- **In Gift Contract**: We use Context to check the `extra_signatories` list. If the signer matches the person listed in the `Datum`, the Validator returns `True` (Unlock!).
