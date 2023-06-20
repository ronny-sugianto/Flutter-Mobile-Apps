import 'package:flutter/material.dart';

class LiveChipItemWidget extends StatefulWidget {
  const LiveChipItemWidget({Key? key}) : super(key: key);

  @override
  State<LiveChipItemWidget> createState() => _LiveChipItemWidgetState();
}

class _LiveChipItemWidgetState extends State<LiveChipItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.4),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.fastfood_rounded,
            color: Colors.redAccent,
            size: 12,
          ),
          const SizedBox(width: 4),
          Text(
            'Join',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
