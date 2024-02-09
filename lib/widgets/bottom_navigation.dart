import 'package:flutter/material.dart';
import 'package:cuisine/pages/menu.dart';
import 'package:cuisine/pages/fridge.dart';
import 'package:cuisine/pages/recipes.dart';


class BottomNavigation extends StatefulWidget {
    const BottomNavigation ({Key? key}) : super(key: key);

    @override
    _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
    int _selectedIndex = 0;

    static const List<Widget> _pages = <Widget>[
        Menu(),
        Fridge(),
        Recipes(),
    ];

    void _onItemTapped(int index){
        setState(() {
            _selectedIndex = index;
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Icons.fastfood_outlined),
                        label: '',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.kitchen_outlined),
                        label: '',
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.book_outlined),
                        label: '',
                    ),
                ],
            ),
        );
    }
}