import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/onboarding_page/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingPage extends StatelessWidget {
  final onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.selectedPageIndex,
              itemCount: onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(onBoardingController
                          .onBoardingPages[index].imageAsset,
                      height: Get.height * 0.35,),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          onBoardingController.onBoardingPages[index].title,
                          style: TextStyle(
                            color: CustomColor.kOrangeColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          onBoardingController.onBoardingPages[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: Row(
                children: List.generate(onBoardingController.onBoardingPages.length,
                        (index) => Obx(() => Container(
                            margin: EdgeInsets.all(4),
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: onBoardingController.selectedPageIndex.value == index ? CustomColor.kOrangeColor : Colors.grey,
                              shape: BoxShape.circle
                            ),
                          ),
                        ),
                ),
              ),
            ),

            Positioned(
              right: 20,
              bottom: 25,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: CustomColor.kOrangeColor,
                onPressed: onBoardingController.forwardAction,
                child: Obx(()=> Text(onBoardingController.isLastPage ? 'Start' : 'Next')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
