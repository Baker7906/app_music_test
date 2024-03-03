import 'package:flutter/material.dart';

class Menu {
  const Menu({
    required this.id,
    required this.icon,
    this.color = Colors.white,
  });

  final String id;
  final Color color;
  final IconButton icon;
}

List<Menu> menuData = [
  Menu(
      id: 'menu1',
      icon: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          // Add your onPressed functionality here
        },
      ),
      color: Colors.white),
  Menu(
    id: 'menu2',
    icon: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {
        // Add your onPressed functionality here
      },
    ),
  ),
  // Add more menu items as needed
];

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuData.length,
      itemBuilder: (context, index) {
        final item = menuData[index];
        return ListTile(
          leading: item.icon,
          onTap: () {
            // Add your item tap functionality here
          },
        );
      },
    );
  }
}
