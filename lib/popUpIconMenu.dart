import 'package:flutter/material.dart';

class PopUpIconMenu extends StatelessWidget {
  final Function onSelected;

  const PopUpIconMenu({super.key, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert_rounded), // Vertical dots icon
      onSelected: (value) {
        onSelected(value);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete', style: TextStyle(color: Colors.red)), // Red color for delete
        ),
        const PopupMenuItem(
          value: 'edit',
          child: Text('Edit'),
        ),
      ],
    );
  }
}
