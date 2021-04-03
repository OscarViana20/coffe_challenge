import 'package:coffe_challenge/src/notifier/coffe_notifier.dart';
import 'package:coffe_challenge/src/widgets/coffe_inherited_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final notifier = CoffeInheritedWidget.of(context).notifier;
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: AnimatedBuilder(
        animation: notifier,
        builder: (context, _) {
          return BackButton(
              color: notifier.coffesState == CoffesState.normal
                  ? Colors.white
                  : Colors.black);
        },
      ),
      actions: [
        AnimatedBuilder(
          animation: notifier,
          builder: (context, _) {
            return IconButton(
                icon: Icon(Icons.shopping_bag_outlined),
                color: notifier.coffesState == CoffesState.normal
                    ? Colors.white
                    : Colors.black,
                onPressed: () {});
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
