import 'package:flutter/material.dart';

class UsbToggleCard extends StatelessWidget {
  const UsbToggleCard({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    required this.isLoading,
  });

  final bool isEnabled;
  final Function(bool) onToggle;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isEnabled
                ? Colors.green.withValues(alpha: 0.15)
                : Colors.grey.withValues(alpha: 0.15),
            border: Border.all(
              color: isEnabled ? Colors.green : Colors.grey,
              width: 3,
            ),
          ),
          child: Center(
            child: Icon(
              isEnabled ? Icons.usb : Icons.usb_off,
              size: 72,
              color: isEnabled ? Colors.green : Colors.red,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          isEnabled ? 'USB Debugging ĐANG BẬT' : 'USB Debugging ĐANG TẮT',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: isEnabled ? Colors.green : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Card(
          elevation: 0,
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Bật / Tắt', style: TextStyle(fontSize: 16)),
                const SizedBox(width: 16),
                Switch(
                  value: isEnabled,
                  onChanged: isLoading ? null : onToggle,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'USB Debugging cho phép kết nối thiết bị với máy tính để phát triển và gỡ lỗi.',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[400]),
        ),
      ],
    );
  }
}
