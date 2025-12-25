# 03. Inside `plutus.json` (Giải mã Blueprint)

---

## 🇻🇳 Tiếng Việt

File `plutus.json` được sinh ra tự động khi bạn chạy `aiken build`. Nó đóng vai trò như một bản thiết kế (Blueprint) theo chuẩn **CIP-57**.

### Tại sao nó quan trọng?

Các ứng dụng ví (như MeshSDK, Lucid) không hiểu code Aiken (`.ak`). Chúng chỉ hiểu file JSON này để:

1.  Lấy mã máy (**Compiled Code**) để nạp lên blockchain.
2.  Biết cách tạo **Datum** và **Redeemer** đúng định dạng yêu cầu.

### Cấu trúc chính

1.  **preamble**: Thông tin tên dự án, version.
2.  **validators**: Danh sách các "bác bảo vệ" (Smart Contract).
    - `compiledCode`: Chuỗi Hex dùng để tính ra địa chỉ ví Contract.
    - `hash`: Mã băm địa chỉ Contract.
    - `datum` & `redeemer`: Schema định nghĩa kiểu dữ liệu.
3.  **definitions**: Chi tiết các kiểu dữ liệu (ví dụ `Datum` gồm những trường nào, kiểu bytes hay integer...).

> **Lưu ý**: File này không chứa mật khẩu hay private key. Nó public và an toàn để chia sẻ.

---

## 🇺🇸 English

The `plutus.json` file is automatically generated when you run `aiken build`. It serves as a Blueprint following the **CIP-57** standard.

### Why is it important?

Wallet apps (like MeshSDK, Lucid) do not understand Aiken code (`.ak`). They rely on this JSON file to:

1.  Get the **Compiled Code** to submit to the blockchain.
2.  Know how to construct the **Datum** and **Redeemer** in the correct format.

### Key Structure

1.  **preamble**: Project name, version info.
2.  **validators**: List of "Guards" (Smart Contracts).
    - `compiledCode`: Hex string used to compute the contract address.
    - `hash`: The contract address hash.
    - `datum` & `redeemer`: Schemas defining input types.
3.  **definitions**: Detailed type definitions (e.g., what fields a `Datum` has, whether it's bytes or integer...).

> **Note**: This file contains NO passwords or private keys. It is public and safe to share.
