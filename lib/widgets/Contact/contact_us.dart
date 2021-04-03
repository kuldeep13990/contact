import 'package:flutter/material.dart';
import 'contact_form.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("CONTACT SCREEN WIDGET CALLED");
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              // margin: EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  "assets/images/ic_contact.png",
                  height: mediaQuery.size.height * 0.22,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Text(
                  "Contact us",
                  textAlign: TextAlign.left,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
          // padding: EdgeInsets.only(top: 25, bottom: 10),
          child: Text(
            "HAVE A PRODUCT IDEA IN MIND? TALK TO US ABOUT IT!",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 25),
          child: Text(
            "Get a professional consultation about your dream concept from our expert team!",
            style: TextStyle(
              fontSize: 15,
              color: Color(0xFF585858),
            ),
            textAlign: TextAlign.left,
          ),
        ),
        ContactUsForm(),
      ],
    );
  }
}
