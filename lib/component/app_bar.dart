import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/view_model/ui.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  final String title;
  final bool isLeading;
  final IconData? iconLeading;
  final void Function()? onLeadingPress;

  CustomAppBar({
    Key? key,
    required this.title,
    this.isLeading = false,
    this.iconLeading,
    this.onLeadingPress,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UI>(
      builder: (context, ui, child) {
        return AppBar(
            title: Text(
              widget.title.toUpperCase(),
              style: TextStyle(
                  color: ui.colorWhite,
                  letterSpacing: 1.0,
                  fontSize: ui.fontSize,
                  fontWeight: FontWeight.w600),
            ),
            backgroundColor: ui.colorBlack,
            centerTitle: true,
            leading: widget.isLeading
                ? IconButton(
                    icon: Icon(widget.iconLeading, color: ui.colorWhite),
                    onPressed: widget.onLeadingPress,
                  )
                : null);
      },
    );
  }
}
