import 'package:flutter/material.dart';
import 'package:todo/src/utils/constants/route_name_constants.dart';
import 'package:get/get.dart';

import 'shared/shared_widgets/custom_sized_boxes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed(AppRouteName.kPageDashboard);
    },);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ]),
              child: const Icon(
                Icons.task_rounded,
                color: Colors.black54,
                size: 120,
              ),
            ),
            CustomSizedBox.space16H,
            const Text(
              'TODO APP',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w500,
                color: Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
