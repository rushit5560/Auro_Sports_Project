import 'package:auro_sports_app/common/custom_color.dart';
import 'package:auro_sports_app/pages/notification_page/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  List<NotificationInfo> notificationList = [
    NotificationInfo(
      notificationImgUrl: 'assets/images/category1.png',
      title: 'Your Order has Confirm!',
      description: 'Lorem ipsum dolor sir amet, consectetur adipiscing elit.',
      notificationDate: '22 Dec 2020',
    ),
    NotificationInfo(
      notificationImgUrl: 'assets/images/category2.png',
      title: 'Black Friday Sale!',
      description: 'Lorem ipsum dolor sir amet, consectetur adipiscing elit.',
      notificationDate: '22 Dec 2020',
    ),
    NotificationInfo(
      notificationImgUrl: 'assets/images/category3.png',
      title: '30% Discount On Your First Order',
      description: 'Lorem ipsum dolor sir amet, consectetur adipiscing elit.',
      notificationDate: '22 Dec 2020',
    ),
    NotificationInfo(
      notificationImgUrl: 'assets/images/category4.png',
      title: 'Your Order has Confirm!',
      description: 'Lorem ipsum dolor sir amet, consectetur adipiscing elit.',
      notificationDate: '22 Dec 2020',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: notificationList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(notificationList[index]
                                      .notificationImgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notificationList[index].title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 18),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    notificationList[index].description,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 5,
                      child: Container(
                        child: Text(
                          notificationList[index].notificationDate,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
