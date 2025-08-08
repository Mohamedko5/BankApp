import 'package:bankapp/data_jons/card_json.dart' show cardLists;
import 'package:bankapp/pages/dashboard_page.dart';
import 'package:bankapp/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: getAppBar(context),
      ),
      body: getBody(context),
    );
  }
}

Widget getAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back_ios_new, color: black, size: 22),
    ),
    title: Text(
      'Card',
      style: TextStyle(color: black, fontSize: 20, fontWeight: FontWeight.w600),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_vert, color: black, size: 25),
      ),
    ],
  );
}

Widget getBody(BuildContext context) {
  var size = MediaQuery.of(context).size;
  final PageController controller = PageController();
  return Column(
    children: [
      SizedBox(height: 10),
      Container(
        width: double.infinity,
        height: 240,
        child: PageView(
          controller: controller,
          children: List.generate(cardLists.length, (index) {
            return getCard(
              cardLists[index]['amount'],
              cardLists[index]['currency'],
              cardLists[index]['card_number'],
              cardLists[index]['valid_dateunt'],
              cardLists[index]['bg_color'],
              context,
            );
          }),
        ),
      ),
    ],
  );
}

Widget getCard(
  amount,
  currency,
  cardNumber,
  validDate,
  bgColor,
  BuildContext context,
) {
  var size = MediaQuery.of(context).size;
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            currency,
            style: TextStyle(
              fontSize: 17,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          Text(
            amount,
            style: TextStyle(
              fontSize: 17,
              color: black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      SizedBox(height: 15),
      Container(
        width: size.width * 0.85,
        height: 170,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [bgColor, bgColor.withOpacity(0.7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 6,
              offset: Offset(0, 4), // Shadow position
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Feather.credit_card,
                  color: white.withOpacity(0.3),
                  size: 30,
                ),
                SizedBox(height: 15),
                Text(
                  cardNumber.replaceRange(
                    4,
                    12,
                    '**** ****',
                  ), // Mask middle part of the card number
                  style: TextStyle(
                    fontSize: 20,
                    color: white.withOpacity(0.8),
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Valid Date',
                      style: TextStyle(
                        fontSize: 12,
                        color: white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
                AnimatedOpacity(
                  opacity:
                      1.0, // You can add a delay here to make the logo fade in
                  duration: Duration(seconds: 1),
                  child: Image.asset(
                    'assets/images/master_card_logo.png',
                    width: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
