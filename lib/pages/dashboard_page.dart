import 'package:bankapp/data_jons/balance_json.dart';
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
      backgroundColor: primary, // Replace with primary if needed
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(),
      ),
      body: getBody(context),
    );
  }
}

Widget getAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: primary, // Replace with primary if needed
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
        icon: Icon(AntDesign.search1, color: Colors.white),
      ),
    ],
  );
}

Widget getBody(BuildContext context) {
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
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(balanceLists.length, (index) {
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
                                  balanceLists[index]['currency'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: index == 0
                                        ? white
                                        : white.withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  balanceLists[index]['amount'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: index == 0
                                        ? white
                                        : white.withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Text(
                              balanceLists[index]['description'],
                              style: TextStyle(
                                fontSize: 15,
                                color: white.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ), //
      ),
    ],
  );
}
