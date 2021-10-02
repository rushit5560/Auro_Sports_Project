import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader {

  Widget homePageLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Auro Sports',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Application',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
