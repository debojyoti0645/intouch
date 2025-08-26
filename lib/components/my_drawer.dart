import 'package:flutter/material.dart';
import 'package:intouch/pages/settingspage.dart';
import 'package:intouch/services/auth/auth_service.dart';

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({super.key});

  void logout() {
    //get auth service 
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //logo
              DrawerHeader(
                  child: Center(
                child: Icon(
                  Icons.logo_dev,
                  color: Theme.of(context).colorScheme.primary,
                  size: 40,
                ),
              )),
              //home list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("H O M E"),
                  leading: Icon(Icons.home_outlined,
                      color: Theme.of(context).colorScheme.primary),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);
                  },
                ),
              ),

              //settings list tile
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text("S E T T I N G S"),
                  leading: Icon(
                    Icons.settings_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onTap: () {
                    //pop the drawer
                    Navigator.pop(context);

                    //navigate to settings view
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage()
                        )
                      );
                  },
                ),
              ),
            ],
          ),

          //logout list tile
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 25.0),
            child: ListTile(
              title: Text("L O G O U T"),
              leading: Icon(Icons.logout,
                  color: Theme.of(context).colorScheme.primary),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
