# 04. Off-chain Interaction (Tương tác Off-chain)

---

## 🇻🇳 Tiếng Việt

Phần "On-chain" (Aiken) chỉ là luật chơi. Để thật sự chơi (gửi/nhận tiền), ta cần code "Off-chain" (Typescript với MeshSDK).

### Quy trình hoạt động

File `scripts/index.ts` mà chúng ta viết thực hiện các bước sau:

1.  **Load Blueprint**: Đọc file `plutus.json` để hiểu cấu trúc contract.
2.  **Derive Address**: Tính toán địa chỉ ví (ví dụ `addr_test...`) dựa trên mã máy (Compiled Code). Đây là nơi mọi người sẽ gửi quà vào.
3.  **Tương lai (Lock/Unlock)**:
    - **Gửi quà (Lock)**: Code sẽ tạo một giao dịch gửi ADA vào địa chỉ contract này + đính kèm `Datum` (hash người nhận).
    - **Nhận quà (Unlock)**: Code sẽ tạo giao dịch rút tiền từ địa chỉ này + đính kèm `Redeemer` ("Claim") + ký tên (để chứng minh mình là chủ nhân trong `Datum`).

---

## 🇺🇸 English

The "On-chain" part (Aiken) is just the rules of the game. To actually play (send/receive funds), we need "Off-chain" code (Typescript with MeshSDK).

### The Workflow

The `scripts/index.ts` file we wrote performs these steps:

1.  **Load Blueprint**: Reads `plutus.json` to understand the contract structure.
2.  **Derive Address**: Calculates the wallet address (e.g., `addr_test...`) based on the Verified Compiled Code. This is where people will send gifts to.
3.  **Future Steps (Lock/Unlock)**:
    - **Locking**: Code creates a transaction sending ADA to this contract address + attaches `Datum` (recipient hash).
    - **Unlocking**: Code creates a transaction withdrawing funds from this address + attaches `Redeemer` ("Claim") + signs it (to prove ownership matching the `Datum`).
