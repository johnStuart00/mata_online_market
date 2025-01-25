import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          expandedHeight: 300,
          // flexibleSpace: FlexibleSpaceBar(
          //   background: Image.asset(
          //     'assets/images/home_screen/banner.png',
          //     fit: BoxFit.cover,
          //   ),
          // ),
        )
      ],
    ));
  }
}
