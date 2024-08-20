import 'package:athlete_go/aag_testing/logic/sh_provider.dart';
import 'package:athlete_go/aag_testing/widgets/sh_view_card.dart';
import 'package:athlete_go/aag_testing/widgets/sh_water_widget.dart';
import 'package:athlete_go/aag_testing/widgets/sh_weight_widget.dart';
import 'package:athlete_go/core/aag_app_fonts.dart';
import 'package:athlete_go/core/aag_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AagTesting extends StatefulWidget {
  const AagTesting({super.key});

  @override
  State<AagTesting> createState() => _AagTestingState();
}

class _AagTestingState extends State<AagTesting>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Text(
          'Sport and Health',
          style: AagAppFonts.s20w700,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 3,
            child: DefaultTabController(
              length: 2,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      ShWaterWidget(),
                      Spacer(),
                      ShWeightWidget(),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                      color: AagAppColors.blueBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      controller: _tabController,
                      dividerColor: Colors.transparent,
                      indicator: BoxDecoration(
                        color: AagAppColors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: const [
                        Tab(text: 'Sport'),
                        Tab(text: 'Health'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Consumer<ShProvider>(
                      builder: (ctx, provider, _) {
                        var sports = provider.sports;
                        var health = provider.health;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: TabBarView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: sports.length,
                                itemBuilder: (ctx, index) {
                                  return ShViewCard(
                                    data: sports[index],
                                  );
                                },
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: health.length,
                                itemBuilder: (ctx, index) {
                                  return ShViewCard(
                                    data: health[index],
                                    isSport: false,
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
