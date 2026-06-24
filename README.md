# USB Switcher

Ứng dụng Flutter giúp bật/tắt tính năng USB Debugging trên thiết bị Android một cách dễ dàng.

## Tính năng

- **Bật/Tắt USB Debugging** trực tiếp từ ứng dụng
- **Giao diện tối ưu** với chế độ sáng/tối tự động
- **Thông báo trạng thái** chi tiết
- **Tự động làm mới** khi quay lại ứng dụng
- **Hỗ trợ nhiều nền tảng** (Android, iOS)

## Yêu cầu hệ thống

- Flutter 3.12.2 hoặc cao hơn
- Android SDK 21 trở lên
- iOS 12.0 trở lên

## Cài đặt

### Yêu cầu trước khi cài đặt

1. **Kích hoạt USB Debugging** trên thiết bị Android:
   - Vào `Cài đặt` → `Về thiết bị`
   - Chọn `Phiên bản build` 7 lần liên tiếp
   - Quay lại và chọn `Tùy chọn phát triển`
   - Bật `USB Debugging`

2. **Kết nối thiết bị** với máy tính qua USB

### Cài đặt từ mã nguồn

```bash
# Clone repository
git clone https://github.com/hieu555x/usbswitcher.git
cd usbswitcher

# Cài đặt dependencies
flutter pub get

# Chạy ứng dụng
flutter run
```

## Cách sử dụng

### Giao diện chính

1. **Trạng thái USB Debugging**:
   - Hình tròn xanh: USB Debugging đang bật
   - Hình tròn xám: USB Debugging đang tắt
   - Biểu tượng USB: Hiển thị trạng thái hiện tại

2. **Điều khiển**:
   - Nhấn vào nút chuyển đổi để bật/tắt USB Debugging
   - Sử dụng nút làm mới (icon ↻) để cập nhật trạng thái

3. **Chế độ sáng/tối**:
   - Nhấn biểu tượng mặt trời (☀️) để chuyển đổi giữa chế độ sáng và tối
   - Ứng dụng tự động chuyển đổi theo chế độ hệ thống

### Các chức năng chính

- **Bật USB Debugging**: Khi bạn nhấn vào nút chuyển đổi, ứng dụng sẽ yêu cầu quyền và bật tính năng
- **Tắt USB Debugging**: Khi bạn nhấn vào nút chuyển đổi, ứng dụng sẽ tắt tính năng
- **Làm mới trạng thái**: Khi nhấn nút làm mới, ứng dụng sẽ kiểm tra lại trạng thái hiện tại của USB Debugging

## Quyền và bảo mật

### Quyền cần thiết

- **Quyền truy cập USB**: Để điều khiển USB Debugging
- **Quyền phát triển**: Để thay đổi cài đặt hệ thống

### Cảnh báo bảo mật

- Ứng dụng yêu cầu quyền đặc biệt để hoạt động
- Tính năng này chỉ nên được sử dụng trên thiết bị của bạn
- Không nên cài đặt lên thiết bị không kiểm soát

## Lỗi và vấn đề thường gặp

### Vấn đề kết nối

1. **"Không thể kết nối thiết bị"**:
   - Kiểm tra kết nối USB
   - Đảm bảo USB Debugging được bật trên thiết bị
   - Cài đặt lại driver USB

2. **"Quyền bị từ chối"**:
   - Đảm bảo bạn đã bật USB Debugging trên thiết bị
   - Kiểm tra quyền ứng dụng trong cài đặt hệ thống

3. **"Không thể thay đổi trạng thái"**:
   - Kiểm tra phiên bản Android của thiết bị
   - Đảm bảo ứng dụng có đủ quyền truy cập

## Bảo trì và cập nhật

### Cập nhật phiên bản mới

```bash
git pull origin main
flutter pub get
```

### Báo lỗi

Nếu bạn gặp bất kỳ lỗi nào, vui lòng tạo issue trên GitHub với:
- Mô tả chi tiết lỗi
- Phiên bản Flutter của bạn
- Phiên bản Android của thiết bị
- Bước để tái hiện lỗi

## Đóng góp

Chúng tôi hoan nghênh mọi đóng góp từ cộng đồng:

1. Fork repository
2. Tạo branch mới (`git checkout -b feature/AmazingFeature`)
3. Commit thay đổi (`git commit -m 'Add some AmazingFeature'`)
4. Push lên branch (`git push origin feature/AmazingFeature`)
5. Mở Pull Request

## Giấy phép

Dự án này được cấp phép theo giấy phép MIT - xem file [LICENSE](LICENSE) để biết thêm thông tin.

## Thông tin liên hệ

- GitHub: [https://github.com/hieu555x/usbswitcher](https://github.com/hieu555x/usbswitcher)
- Email: hieu555x@gmail.com

---

*© 2026 USB Switcher. Tất cả quyền được bảo lưu.*