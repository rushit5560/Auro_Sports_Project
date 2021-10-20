import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ZZZZZ extends StatelessWidget {
  const ZZZZZ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: CustomColor.kLightOrangeColor
                  ),
                  child: Row(
                    children: [

                      Expanded(
                        flex: 30,
                        child: Container(
                          height: Get.width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage('assets/images/newarrival2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Product name Product name Product name Product name Product name Product name',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(height: 10),

                              Row(
                                children: [
                                  Text(
                                      '\$199',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                      '\$199',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
