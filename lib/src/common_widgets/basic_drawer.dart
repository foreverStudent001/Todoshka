import 'package:flutter/material.dart';
import '../pages/presentation/primary/first_page.dart';
import '../pages/presentation/primary/second_page.dart';


class BasicDrawer extends StatelessWidget {
  const BasicDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView( //customize by wrapping ListView in a container
          children: [
            DrawerHeader(
              child: Center(
                //child: MyClippyWidget(),
                  child: Text(
                    'L O G O',
                    style: TextStyle(fontSize: 35),
                  )),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Page 1',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text(
                'Page 2',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
          ],
        ),
      ),
    );
    //endDrawer: Drawer(),    //NOTE: BRINGS UP DRAWER FROM THE OTHER SIDE...KEEP THIS IN MIND...!
  }
}

