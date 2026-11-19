
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: const Icon(
            Icons.menu_book_rounded,
            color: Color(0xFF315BE5),
            size: 23,
          ),
        ),

        const SizedBox(width: 10),

        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Read-daily',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'PUBLIC LIBRARY',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 7,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
