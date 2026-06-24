import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRefresh,
    required this.isLoading,
  });

  final String? errorMessage;
  final Function() onRefresh;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.error_outline, size: 72, color: Colors.red),
        const SizedBox(height: 20),
        Text(
          errorMessage ?? 'Đã có lỗi xảy ra',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: isLoading ? null : onRefresh,
          child: const Text('Thử lại'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
        ),
      ],
    );
  }
}