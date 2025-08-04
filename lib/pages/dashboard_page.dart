// تأكد من الاستيراد الصحيح
import 'package:bankapp/data_jons/balance_json.dart';
import 'package:bankapp/pages/card_page.dart' show CardPage;
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
      body: getBody(context),
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
            Expanded(
              child: Container(
                width: size.width,
                child: Row(
                  children: [
                    SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Add Money",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Exchange",
                            style: TextStyle(
                              color: white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 25,
                left: 20,
                right: 20,
                bottom: 40,
              ),
              child: getAccountSection(context),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget getAccountSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Account',
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 15),
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 10,
              blurRadius: 10,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(AntDesign.wallet, color: primary, size: 20),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '4823 1234 5678 9012',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Icon(Icons.keyboard_arrow_down, color: primary),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Divider(thickness: 0.2),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          MaterialIcons.euro_symbol,
                          color: primary,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text('18 199.24 EUR', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Divider(thickness: 0.2),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: secondary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          MaterialCommunityIcons.currency_gbp,
                          color: primary,
                          size: 20,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '36.67 GBP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cards',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 98,
            height: 22,
            decoration: BoxDecoration(
              color: secondary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Ionicons.ios_add, color: primary, size: 16),
                Text(
                  ' Add Card',
                  style: TextStyle(
                    fontSize: 11,
                    color: primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
      SizedBox(height: 15),
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CardPage()),
          );
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 10,
                blurRadius: 10,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: secondary.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            AntDesign.creditcard,
                            color: primary,
                            size: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'EUR *2338',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '8 199.24 EUR',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
