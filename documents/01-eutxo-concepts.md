# 01. E-UTxO & Smart Contract Basics (Cơ bản về E-UTxO & Hợp đồng thông minh)

---

## 🇻🇳 Tiếng Việt

### 1. E-UTxO là gì?

Blockchain Cardano sử dụng mô hình **E-UTxO** (Extended Unspent Transaction Output). Hãy tưởng tượng nó giống như tiền mặt trong ví của bạn:

- **UTxO**: Giống như từng tờ tiền lẻ. Bạn không có "số dư tổng" ghi trong sổ cái ngân hàng, mà bạn có "nhiều tờ tiền" (UTxOs) cộng lại thành tổng tài sản.
- **Chi tiêu**: Khi bạn tiêu tiền, bạn phải lấy một (hoặc nhiều) tờ tiền ra, trả cho người bán, và nhận lại tiền thừa (nếu có). Tờ tiền cũ bị hủy đi, những tờ tiền mới (cho người bán và tiền thừa cho bạn) được tạo ra.

### 2. Smart Contract (Validator) là gì?

Trong Cardano, Smart Contract thực chất là một **Validator Script** (Kịch bản kiểm chứng).

- **Địa chỉ ví thường**: Ai giữ chìa khóa (Private Key) thì người đó được tiêu tiền.
- **Địa chỉ Smart Contract**: Không ai giữ chìa khóa cả. Thay vào đó, nó có một "bác bảo vệ" (chính là đoạn code Validator) đứng canh gác.
- **Luật chơi**: Khi ai đó muốn lấy UTxO từ địa chỉ này, họ phải chứng minh với "bác bảo vệ" rằng họ thỏa mãn điều kiện đã lập trình sẵn (ví dụ: "Phải là người có chữ ký X"). Nếu "bác bảo vệ" gật đầu (trả về `True`), bạn được tiêu UTxO đó. Nếu lắc đầu (`False`), giao dịch thất bại.

---

## 🇺🇸 English

### 1. What is E-UTxO?

Cardano uses the **E-UTxO** (Extended Unspent Transaction Output) model. Think of it like cash in your wallet:

- **UTxO**: Like individual banknotes. You don't have a "total balance" entry in a bank ledger; instead, you hold "multiple notes" (UTxOs) that sum up to your total wealth.
- **Spending**: When you spend, you pick one (or more) notes, pay the merchant, and get change back (if any). The old notes are destroyed, and new notes (for the merchant and your change) are created.

### 2. What is a Smart Contract (Validator)?

In Cardano, a Smart Contract is essentially a **Validator Script**.

- **Regular Wallet Address**: Whoever holds the Private Key can spend the funds.
- **Smart Contract Address**: No one holds a private key. Instead, there is a "Guard" (the Validator code) standing watch.
- **The Rules**: When someone wants to take a UTxO from this address, they must prove to the "Guard" that they meet the pre-programmed conditions (e.g., "Must have signature X"). If the "Guard" approves (returns `True`), the UTxO can be spent. If denied (`False`), the transaction fails.
