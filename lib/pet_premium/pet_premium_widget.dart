import 'package:athlete_go/core/aag_btm.dart';
import 'package:flutter/material.dart';

class AagPremiumWidget extends StatelessWidget {
  const AagPremiumWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            child: Image.asset('assets/icons/close.png'),
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AagDownBar()),
                );
              }
            },
          ),
          const SizedBox(
            width: 24,
          )
        ],
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'Premium',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/premium.png'))),
                ),
              ),
              const Center(
                child: Text(
                  'Advantages:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 26,
              ),
              const PremiumItemWidget(
                  text: 'No Ads: Removes all advertisements.'),
              const SizedBox(
                height: 26,
              ),
              const PremiumItemWidget(
                  text:
                      'Restricting access to the function Adding your own asanas only for premium account users'),
              const SizedBox(
                height: 26,
              ),
              const PremiumItemWidget(
                  text: 'No Ads: Removes all advertisements.'),
              const SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PremiumItemWidget extends StatelessWidget {
  final String text;
  const PremiumItemWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          width: 20,
        ),
        Image.asset('assets/icons/yoga_human.png'),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            maxLines: 5,
          ),
        )
      ],
    );
  }
}
