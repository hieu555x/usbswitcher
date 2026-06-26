import 'package:flutter/material.dart';
import 'package:usbswitcher/widgets/step_card.dart';
import 'package:usbswitcher/widgets/toggle_card.dart';

class UsbDebuggerScreen extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onToggle;
  final bool isLoading;

  const UsbDebuggerScreen({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ToggleCard(
            isEnabled: isEnabled,
            onToggle: onToggle,
            isLoading: isLoading,
          ),
          SizedBox(height: 28),
          Row(
            children: [
              Icon(Icons.info_outline, size: 18),
              SizedBox(height: 12, width: 12),
              Text('Setup instruction', style: TextStyle(fontSize: 18)),
            ],
          ),
          const SizedBox(height: 24),
          const StepCard(
            number: 1,
            title: 'Enable Developer Options',
            desc: "Tap 'Build Number' 7 times in 'About Phone' settings.",
            showLinkIcon: true,
          ),
          const SizedBox(height: 12),
          const StepCard(
            number: 2,
            title: 'Toggle Debugging',
            desc:
                "Locate 'USB Debugging' in Developer Options and switch it on.",
          ),
        ],
      ),
    );
  }
}
