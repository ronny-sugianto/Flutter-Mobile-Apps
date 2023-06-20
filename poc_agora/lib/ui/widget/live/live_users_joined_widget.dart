import 'package:flutter/material.dart';
import 'package:poc_agora/ui/ui.dart';

class LiveUsersJoinedWidget extends StatelessWidget {
  final List<LiveUserJoinedItemCardWidget> children;

  const LiveUsersJoinedWidget({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (children.length) {
      case 1:
        return children.first;
      case 2:
        return _frameWidget(
          child: Row(
            children: [
              Expanded(child: children.first),
              const SizedBox(width: 3),
              Expanded(child: children.last),
            ],
          ),
        );
      case 3:
        return _frameWidget(
          child: Column(
            children: [
              children.first,
              const SizedBox(height: 3),
              Row(
                children: [
                  Expanded(child: children[1]),
                  const SizedBox(width: 3),
                  Expanded(child: children.last),
                ],
              ),
            ],
          ),
        );
      default:
        return _frameWidget(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 253,
              crossAxisCount: 2,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,
            ),
            itemCount: children.length,
            itemBuilder: (BuildContext context, int index) => children[index],
          ),
        );
    }
  }

  Widget _frameWidget({required Widget child}) => SafeArea(
        child: Container(
          width: double.infinity,
          height: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 85,
            horizontal: 16,
          ),
          alignment: Alignment.topCenter,
          child: child,
        ),
      );
}
