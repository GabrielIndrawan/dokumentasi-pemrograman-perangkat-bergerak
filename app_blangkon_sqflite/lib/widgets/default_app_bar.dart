import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget{
  const DefaultAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.indigo,
      leading: Center(
        child: IconButton(onPressed: () {Navigator.of(context).pop();}, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}