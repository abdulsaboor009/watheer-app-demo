import 'package:flutter/material.dart';
import 'package:watheer_demo/views/screens/home/components/home_appbar.dart';
import 'package:watheer_demo/views/screens/home/components/other_services.dart';
import 'package:watheer_demo/views/screens/home/components/psychological_services.dart';
import 'package:watheer_demo/views/widgets/screen_utils_size.dart';
import 'package:watheer_demo/views/widgets/sizedbox_extention.dart';
import 'components/most_visited.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  bool isUserGuest;
  HomeScreen({super.key, this.isUserGuest = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDisposed = false;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    if (!_isDisposed) {
      setState(() {
        isLoadDate = true;
      });
    }
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  bool isLoadDate = false;
  int selectedTab = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          children: [
            HomeAppBar(
              onTabselected: (selectedTabIndex) {
                setState(() {
                  selectedTab = selectedTabIndex;
                });
              },
              isUserGuest: widget.isUserGuest,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveSize.w * 22,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        selectedTab == 1
                            ? Column(
                                children: [
                                  MostVisited(
                                    isUserGuest: widget.isUserGuest,
                                    isLoadData: isLoadDate,
                                  ),
                                  30.height,
                                  HomePsychologicalServices(
                                    isUserGuest: widget.isUserGuest,
                                    isLoadData: isLoadDate,
                                  ),
                                ],
                              )
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  25.height,
                                  HomeOtherServices(
                                    isUserGuest: widget.isUserGuest,
                                    isLoadData: isLoadDate,
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
