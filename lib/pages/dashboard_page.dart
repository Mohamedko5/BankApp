import 'package:bankapp/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(context), // Pass context here
    );
  }
}

Widget getAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: primary,
    leading: IconButton(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60",
        ),
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(AntDesign.search1, color: white),
      ),
    ],
  );
}

Widget getBody(BuildContext context) {
  // Accept context as a parameter
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      Container(
        width: size.width,
        height: size.height * 0.25,
        decoration: BoxDecoration(color: primary),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 100,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Container(
                      width: size.width * 0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Data",
                                style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
