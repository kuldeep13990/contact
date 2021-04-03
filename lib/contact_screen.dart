import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'widgets/Contact/contact_us.dart';

class ContactScreen extends StatelessWidget {
  static const routeName = "ContactScreen";

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(
          "Contact",
        ),
      ),
      body: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Theme(
                data: Theme.of(context).copyWith(
                  disabledColor: Colors.grey,
                  iconTheme: IconTheme.of(context).copyWith(
                    color: Colors.red,
                    size: 28,
                  ),
                ),
                child: ContactUs()),
          ),
        ),
      ),
    );
  }
}
