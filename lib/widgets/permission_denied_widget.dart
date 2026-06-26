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
          'Not have the permission WRITE_SECURE_SETTINGS. Please connect the phone to the computer and run the command below:',
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
          'Run this command in the terminal on the Computer (just this once),\n'
          'and press the refresh button on the top bar once.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: isLoading ? null : onRefresh,
          icon: const Icon(Icons.refresh),
          label: const Text('Already run the command - Check again'),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ],
    );
  }
}