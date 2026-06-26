import 'package:flutter/material.dart';

class StepCard extends StatelessWidget {
  final int number;
  final String title;
  final String desc;
  final bool showLinkIcon;

  const StepCard({
    super.key,
    required this.number,
    required this.title,
    required this.desc,
    this.showLinkIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : null,
        borderRadius: BorderRadius.circular(16),
        border: BoxBorder.all(
          color: Theme.of(context).brightness == Brightness.light
              ? Colors.transparent
              : Colors.white,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF6C63D6),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          if (showLinkIcon) ...[
            SizedBox(width: 8),
            Icon(Icons.open_in_new, size: 20, color: Colors.blue[700]),
          ],
        ],
      ),
    );
  }
}
