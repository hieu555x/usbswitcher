import 'package:flutter/material.dart';

class ToggleCard extends StatelessWidget {
  final bool isEnabled;
  final ValueChanged<bool> onToggle;
  final bool isLoading;

  const ToggleCard({
    super.key,
    required this.isEnabled,
    required this.onToggle,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : null,
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.transparent
              : Colors.white,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "USB Debugging",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.black87
                      : null,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isEnabled ? Colors.green : Colors.redAccent,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(isEnabled ? 'Connected' : 'Disconnect'),
                ],
              ),
            ],
          ),
          Switch(
            value: isEnabled,
            onChanged: isLoading ? null : onToggle,
            activeThumbColor: Colors.white,
            activeTrackColor: Colors.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
