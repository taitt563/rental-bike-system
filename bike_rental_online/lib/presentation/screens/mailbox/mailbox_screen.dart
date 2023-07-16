import 'package:bike_rental_online/presentation/screens/components/custom_appbar.dart';
import 'package:flutter/material.dart';

class MailboxScreen extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBarWidget(
          scaffoldKey: scaffoldKey, title: "Mailbox", showDrawer: false),
      body: Center(
        child: Text('Mailbox Screen'),
      ),
    );
  }
}
