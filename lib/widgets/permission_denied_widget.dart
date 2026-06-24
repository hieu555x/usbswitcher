import 'package:flutter/material.dart';

class PermissionDeniedWidget extends StatelessWidget {
  const PermissionDeniedWidget({
    super.key,
    required this.onRefresh,
    required this.isLoading,
  });

  final Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.lock_outline, size: 72, color: Colors.orange),
        const SizedBox(height: 20),
        Text(
          'Chưa có quyền WRITE_SECURE_SETTINGS',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.shade900.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.orange.shade700.withOpacity(0.5)),
          ),
          child: const SelectableText(
            'adb shell pm grant com.example.usbswitcher '
            'android.permission.WRITE_SECURE_SETTINGS',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Chạy lệnh trên qua máy tính (1 lần duy nhất),\n'
          'sau đó nhấn nút làm mới ở trên.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: isLoading ? null : onRefresh,
          icon: const Icon(Icons.refresh),
          label: const Text('Đã chạy lệnh - Kiểm tra lại'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}