import 'package:delilo/widgets/menu_item_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            child: DrawerHeader(
                child: Center(
                  child: Container(
                    color: Colors.green,
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment(-1, -1), child: Icon(Icons.close)),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                          child: Center(
                            //alignment: Alignment(1,1),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person_pin,
                                  size: 70,
                                  color: Colors.white,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(10, 15, 0, 0),
                                      child: Text(
                                        "Gold Member",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Align(
                              alignment: Alignment(1, 1),
                              child: Text(
                                "Rate Us",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                      ],
                    ),
                  ),
                )),
          ),
          MenuItemTile('/', 'Mobiles', 'assets/Icon awesome-mobile-alt.png'),
          MenuItemTile('/fashionmain', 'Fashion', 'assets/Group 418.png'),
          MenuItemTile('/', 'Household', 'assets/lamp.png'),
          MenuItemTile('/', 'Beauty And Health', 'assets/Group 419.png'),
          MenuItemTile('/', 'Toys & Baby Products', 'assets/Group 424.png'),
          MenuItemTile('/', 'Nearby Markets', 'assets/Group 420.png'),
          MenuItemTile('/', 'Dairy Products', 'assets/Group 421.png'),
          MenuItemTile('/', 'Sports & More', 'assets/Group 422.png'),
          MenuItemTile('/', 'Party & Gatherings', 'assets/Group 423.png'),
          MenuItemTile(
              '/', 'Travel & Explore', 'assets/Icon material-card-travel.png'),
          MenuItemTile('/orders', 'Orders', 'assets/Group 408.png'),
          MenuItemTile('/', 'History', 'assets/Icon material-history.png'),
          MenuItemTile('/', 'Coupons', 'assets/%.png'),
          MenuItemTile(
              '/', 'Be A Seller', 'assets/Icon ionic-ios-person-add.png'),
          MenuItemTile(
              '/', 'Customer Support', 'assets/Icon ionic-ios-person-add.png'),
        ],
      ),
    );
  }
}
