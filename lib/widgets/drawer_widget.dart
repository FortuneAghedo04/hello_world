import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              accountName: Text('Fortune',style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              accountEmail: Text('fortune@gmail.com', style: TextStyle(fontSize:16.0)),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home,
              color:Colors.blueGrey
            ),
            title: Text('Home', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.person,
                color:Colors.blueGrey
            ),
            title: Text('My Account', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.cart_fill,
                color:Colors.blueGrey
            ),
            title: Text('My Orders', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.heart_fill,
                color:Colors.blueGrey
            ),
            title: Text('My Wish List', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.settings,
                color:Colors.blueGrey
            ),
            title: Text('Settings', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app,
                color:Colors.blueGrey
            ),
            title: Text('Log Out', style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
