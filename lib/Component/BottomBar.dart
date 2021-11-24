import 'package:flutter/material.dart';

// Stateful widget created
class BottomBar extends StatefulWidget {
  int bottom;
  BottomBar({required this.bottom});
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
// index given for tabs
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

// Number of tabs
  final tabs = [
    Center(child: Text("My Shift", style: TextStyle(color: Colors.white))),
    Center(child: Text("Availbility", style: TextStyle(color: Colors.white))),
    Center(child: Text("Home", style: TextStyle(color: Colors.white))),
    Center(child: Text("Notifications", style: TextStyle(color: Colors.white))),
    Center(child: Text("Account", style: TextStyle(color: Colors.white))),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],

      // floating action button in center
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setBottomBarIndex(4);
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // bottom app bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // button 1
              IconButton(
                icon: Image.asset("assets/images/myshift.png",
                  height: 25,
                  width: 25,),
                onPressed: () {
                  setBottomBarIndex(0);
                },
                splashColor: Colors.white,
              ),

              // button 2
              IconButton(
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: currentIndex == 1 ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(1);
                  }),
              SizedBox.shrink(),

              // button 3
              IconButton(
                  icon: Icon(
                    Icons.person,
                    color: currentIndex == 2 ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(2);
                  }),

              // button 4
              IconButton(
                  icon: Icon(
                    Icons.insert_drive_file,
                    color: currentIndex == 3 ? Colors.green : Colors.grey,
                  ),
                  onPressed: () {
                    setBottomBarIndex(3);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
