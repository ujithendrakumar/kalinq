import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(FeatherIcons.moreVertical, size: 18, color: Colors.grey),
      onSelected: (value) {
        // if (value == 'edit') {
        //   _showAddNoteDialog(editIndex: index);
        // } else if (value == 'copy') {
        //   _copyNoteToClipboard(note);
        // } else if (value == 'delete') {
        //   _showDeleteConfirmation(index);
        // }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'edit',
          child: Row(
            children: [
              Icon(FeatherIcons.edit3, size: 16),
              SizedBox(width: 8),
              Text("Edit"),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'copy',
          child: Row(
            children: [
              Icon(FeatherIcons.copy, size: 16),
              SizedBox(width: 8),
              Text("Copy"),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Row(
            children: [
              Icon(FeatherIcons.trash2, color: Colors.red, size: 16),
              SizedBox(width: 8),
              Text("Delete"),
            ],
          ),
        ),
      ],
    );
  }
}
