import "package:flutter/material.dart";

class UniversalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const UniversalAppBar({super.key, required this.title});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      leading: Icon(
        Icons.contact_page,
        size: 36,
        color: Theme.of(context).colorScheme.primary,
      ),
      // actions: [
      //   InkWell(
      //     customBorder: CircleBorder(),
      //     onTap: () => {},
      //     child: Padding(
      //       padding: EdgeInsetsGeometry.all(8),
      //       child: Icon(
      //         Icons.notifications_outlined,
      //         color: Theme.of(context).colorScheme.primary,
      //         size: 32,
      //       ),
      //     ),
      //   ),
      //   SizedBox(width: 10),
      // ],
    );
  }
}
