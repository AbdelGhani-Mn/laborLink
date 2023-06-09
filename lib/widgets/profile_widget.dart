import 'dart:io';

import 'package:flutter/material.dart';
import 'package:laborlink/misc/colors.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Theme.of(context).colorScheme.primary;
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
              bottom: 0, right: 4, child: buildEditIcon(AppColors.mainColor)),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = imagePath.contains('https://')
     ? NetworkImage(imagePath)
     : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(
            onTap: onClicked,
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
    color: Colors.white,
    all: 3,
    child : buildCircle(
        color: AppColors.mainColor,
        all: 8,
        child: Icon(
          isEdit ? Icons.add_a_photo_rounded : Icons.edit_rounded,
          color: Colors.white,
          size: 20,
        ),
        ),
      );

  Widget buildCircle(
      {required Color color, required double all, required Widget child}) {
    return ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
    );
  }
}
