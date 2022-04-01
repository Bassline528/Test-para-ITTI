import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_itti/services/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UIProvider>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'UsuariosDB'),
        BottomNavigationBarItem(icon: Icon(Icons.api), label: 'UsuariosAPI'),
      ],
    );
  }
}