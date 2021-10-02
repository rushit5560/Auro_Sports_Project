
import 'package:auro_sports_app/common/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

enum _TimelineStatus {
  done,
  sync,
  inProgress,
  todo,
}

extension on _TimelineStatus {
  bool get isInProgress => this == _TimelineStatus.inProgress;
}

const kTileHeight = 50.0;

class OrderTrackingPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    List<_TimelineStatus> data = [
    _TimelineStatus.done,
    _TimelineStatus.inProgress,
    _TimelineStatus.inProgress,
    _TimelineStatus.todo
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Tracking'),
        centerTitle: true,
        backgroundColor: CustomColor.kOrangeColor,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(height: 20),
          Text('Order Track : #145kr',
            textScaleFactor: 1.4,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          FixedTimeline.tileBuilder(
            theme: TimelineThemeData(
              color: CustomColor.kOrangeColor,
              connectorTheme: ConnectorThemeData(
                thickness: 15,
                space: 15,
              ),
              indicatorTheme: IndicatorThemeData(
                size: 20,
                color: Colors.grey.shade300,
              ),
              nodeItemOverlap: true,
            ),
            builder: TimelineTileBuilder.connectedFromStyle(
              itemCount: 4,
              contentsAlign: ContentsAlign.basic,
              oppositeContentsBuilder: (context, int) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '11 Aug 2021',
                    textScaleFactor: 1.1,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },

              contentsBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Contents',
                        textScaleFactor: 1.2,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                      Text('Contents2asasasasasassassassssas',
                        textScaleFactor: 1.1,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                    ],
                  ),
                );
              },

              connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) {
                return IndicatorStyle.dot;
              },


            ),
          )

          /*Expanded(
            child: Timeline.tileBuilder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              theme: TimelineThemeData(
                // nodePosition: 0,
                nodeItemOverlap: true,
                connectorTheme: ConnectorThemeData(
                  color: CustomColor().kOrangeColor,
                  // thickness: 15.0,
                ),
              ),
              padding: EdgeInsets.only(top: 20.0),
              builder: TimelineTileBuilder.connected(
                indicatorBuilder: (context, index) {
                  final status = data[index];
                  return OutlinedDotIndicator(
                    color: CustomColor().kOrangeColor,
                    // status.isInProgress ? Color(0xff6ad192) : Color(0xffe6e7e9),
                    backgroundColor: Colors.white,
                    // status.isInProgress ? Color(0xffd4f5d6) : Color(0xffc2c5c9),
                    // borderWidth: 1,
                    // status.isInProgress ? 3.0 : 2.5,
                  );
                },
                connectorBuilder: (context, index, connectorType) {
                  var color;
                  // if (index + 1 < data.length - 1 &&
                  //     data[index].isInProgress &&
                  //     data[index + 1].isInProgress) {
                  //   color = data[index].isInProgress ? Color(0xff6ad192) : null;
                  // }
                  return SolidLineConnector(
                    color: color,
                  );
                },
                contentsBuilder: (context, index) {
                  var height;
                  if (index + 1 < data.length - 1 &&
                      data[index].isInProgress &&
                      data[index + 1].isInProgress) {
                    height = kTileHeight - 10;
                  } else {
                    height = kTileHeight + 5;
                  }
                  return SizedBox(
                    height: height,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _EmptyContents(),
                    ),
                  );
                },
                itemCount: data.length,
              ),
            ),
          )*/
        ],
      ),
    );
  }

}

class _EmptyContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
        Text('Contents',
                      textScaleFactor: 1.2,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                    Text('Contents2asasasasasassassassssas',
                      textScaleFactor: 1.1,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,),
        ],
      ),

    );
  }
}
