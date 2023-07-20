import 'package:desktop_application/web1/helpers/responsive.dart';
import 'package:desktop_application/web1/src/screens/app_bar.dart';
import 'package:desktop_application/web1/src/widgets/large_screen.dart';
import 'package:desktop_application/web1/src/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: customAppBar(context, scaffoldKey),
      drawer: Drawer(),
      body: ResponsiveWidget(
        largeScreen: LargeScreen(),
        smallScreen: SmallScreen(),
      ),
    );
  }
}
