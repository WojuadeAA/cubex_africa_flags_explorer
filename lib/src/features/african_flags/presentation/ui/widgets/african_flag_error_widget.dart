import 'package:flutter/material.dart';

class AfricanFlagsErrorWidget extends StatelessWidget {
  const AfricanFlagsErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });
  final String message;
  final Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 50),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
          const SizedBox(height: 20),
          TextButton.icon(icon: const Icon(Icons.refresh), label: const Text('Try Again'), onPressed: onRetry)
        ],
      ),
    );
  }
}
