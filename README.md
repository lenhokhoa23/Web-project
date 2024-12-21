# Nhóm chúng em đã làm 2 website 'độc lập' cho bài tập lớn này: Bao gồm FruitHub và Food Order Website.

**Với FruitHub nhóm chúng em đã deploy được (ở phía bên dưới), còn với Food Order Website thì chúng em xin phép được thực hiện việc demo. Dưới đây là phần trình bày cho 2 website của nhóm chúng em:**

# Food Order Website:

**Do khối lượng file lớn nên các nền tảng cho phép deploy dự án miễn phí không hỗ trợ deploy được cho website này của nhóm chúng em nên em sẽ để link demo ở ngay bên dưới đây:**
https://drive.google.com/file/d/15KnrYyVvSjqZDYGGQ18DK3rOie4qbiTy/view?usp=sharing

> Dưới đây là database của website này: 
> ![image](https://github.com/user-attachments/assets/a48b38af-e71d-441d-b5d3-faa1d16ad100)

> # Quan hệ giữa các bảng

## 1. Bảng `user`

- **Quan hệ**:
  - **1-N**: Một `user` có thể là chủ sở hữu (`ownerId`) của nhiều `restaurant`.
  - **1-N**: Một `user` có thể đặt nhiều `order`.
  - **1-1**: Một `user` có một `customer` (với vai trò là khách hàng).
  - **1-N**: Một `user` có thể có nhiều `address`.

---

## 2. Bảng `restaurant`

- **Quan hệ**:
  - **N-1**: Mỗi `restaurant` được sở hữu bởi một `user` (`ownerId`).
  - **1-N**: Một `restaurant` có thể cung cấp nhiều `menuItem`.
  - **1-N**: Một `restaurant` có thể liên kết với nhiều `order`.

---

## 3. Bảng `menuItem`

- **Quan hệ**:
  - **N-1**: Mỗi `menuItem` thuộc về một `restaurant`.
  - **1-N**: Một `menuItem` có thể được thêm vào nhiều `orderItem` (khi khách đặt hàng).

---

## 4. Bảng `order`

- **Quan hệ**:
  - **N-1**: Mỗi `order` được tạo bởi một `user`.
  - **N-1**: Mỗi `order` thuộc về một `restaurant`.
  - **1-N**: Một `order` có thể có nhiều `orderItem`.
  - **1-1**: Một `order` có thể liên kết với một `payment`.
  - **1-N**: Một `order` có thể có nhiều `orderHistory` để ghi nhận trạng thái.

---

## 5. Bảng `orderItem`

- **Quan hệ**:
  - **N-1**: Mỗi `orderItem` thuộc về một `order`.
  - **N-1**: Mỗi `orderItem` liên kết với một `menuItem`.

---

## 6. Bảng `customer`

- **Quan hệ**:
  - **1-1**: Mỗi `customer` tương ứng với một `user`.
  - **N-1**: Một `customer` có thể tham chiếu đến một `timeStamp`.

---

## 7. Bảng `payment`

- **Quan hệ**:
  - **1-1**: Mỗi `payment` liên kết với một `order`.

---

## 8. Bảng `orderHistory`

- **Quan hệ**:
  - **N-1**: Mỗi `orderHistory` liên kết với một `order`.

---

## 9. Bảng `address`

- **Quan hệ**:
  - **N-1**: Một `address` thuộc về một `user`.
  - **N-1**: Mỗi `address` có thể tham chiếu đến một `timeStamp`.

---

## 10. Bảng `timeStamp`

- **Quan hệ**:
  - **1-N**: Một `timeStamp` có thể tham chiếu đến:
    - Nhiều `restaurant`.
    - Nhiều `menuItem`.
    - Nhiều `customer`.
    - Nhiều `address`.

# 🍇 **FruitHub** - Fruit Company Management System

> **"Một trang web quản lý công ty bán hoa quả toàn diện."**

**Với sự đóng góp của các thành viên:**

> Lê Nho Khoa (Dev1, Nhóm trưởng)
> Nguyễn Anh Khang (Dev2, thành viên)
> Khổng Quốc Anh (Dev3, thành viên)

FruitHub được xây dựng trên nền tảng **Node.js**, với mục tiêu quản lý công ty một cách toàn diện, thực tế; Dưới đây là mô hình quan hệ và những tính năng mà nhóm chúng em đã triển khai.

![image](https://github.com/user-attachments/assets/25de59da-0019-4f70-8e0e-bedc6c6b40e7)


## 🌟 **Tính năng **

- **Quản lý sản phẩm**:  
  
  - Tìm kiếm và thêm sản phẩm mới.
  - Hiển thị danh sách sản phẩm với giao diện đẹp mắt.
  - Hiển thị những sản phẩm đã hết trong kho.
  - Thêm sản phẩm/ nhà cung cấp sản phẩm mới.
  - Lọc sản phẩm theo nhà cung cấp.

- **Quản lý đơn hàng, doanh thu**:  
  
  - Theo dõi trạng thái đơn hàng: Đang xử lý, Hoàn thành, Đã hủy.
  - Xem giá trị các đơn hàng/ sản phẩm đã bán được.
  - Tìm kiếm đơn hàng.
  - Lọc những đơn hàng theo khoảng ngày nhập vào.
  - Tính tổng doanh thu: theo tất cả, theo khoảng ngày.
  - Liệt kê những khách hàng mua nhiều hàng nhất.
  - Xem chi tiết một đơn hàng bất kì.(Và tổng giá trị đơn hàng đó kèm theo) (Click chuột phải vào 1 đơn hàng bất kì)

- **Quản lý khách hàng**:  
  
  - Lưu trữ thông tin khách hàng chi tiết (tên, địa chỉ, số điện thoại, lịch sử mua hàng).  
  - Lọc ra những khách hàng thân thiết.
  - Tính toán số lượng đơn hàng mà từng khách hàng mua.
  - Xem những khách hàng còn nợ, chưa thanh toán.
  - Tìm kiếm thông tin khách hàng.
  - Thống kê những khoản thanh toán của khách hàng. (Có thể tìm kiếm).

- **Quản lý nhân viên**:  
  
  - Theo dõi thông tin nhân viên, phân quyền rõ ràng (quản lý, nhân viên bán hàng).
  - Tìm kiếm nhân viên (Mã phòng ban, mã NV, tên nhân viên...)
  - Thêm 1 nhân viên mới, xoá một nhân viên cũ.
  - Quản lý sức khoẻ nhân viên, con cái nhân viên.

- **Quản lý lương, chấm công**:
  
  - Tìm kiếm những nhân viên thâm niên, đã gắn bó lâu với công ty.
  - Lọc những nhân viên có thể hiện tốt, đánh giá cao.
  - Cập nhật giờ làm việc, chấm công(đi muộn, ngày nghỉ), cho nhân viên khi nhân viên checkin.
  - Theo dõi lương của mỗi nhân viên (lương cơ bản, lương bonus)
  - Thưởng lương theo từ cá nhân, phòng ban.
  - Cập nhật lương theo chấm công (đi muộn -20000, ngày nghỉ -50000)
  - Tính tổng lương cần trả cho cả công ty.

- **Chăm sóc khách hàng**:  
  
  - Quản lý những phản hồi của khách hàng (Rating, feedback) 
  - Lọc những feedback tốt/ xấu.
  - Kiểm tra những đơn hàng bị đánh giá không tốt.

## 🛠️ **Công nghệ sử dụng**

- **Backend**:  
  
  - Node.js  
  - Express.js
  - EJS (Embedded JavaScript)  

- **Database**:  
  
  - SQL 

## 🚀 **Hướng dẫn sử dụng**

- **Link dự án**: https://web-project-production-0e6a.up.railway.app/
- **Link demo**: https://drive.google.com/drive/folders/1RRAZBHpsoPqo_y6r4sj9OOV0dku7DtQI?fbclid=IwZXh0bgNhZW0CMTAAAR3JArX5Fun84EMDyJDB4UGZSc_KFimfIB20zuGWEmwGJFsED6zkCyXFkZI_aem_lyWD_ms6wunwhcxN36Ziwg
