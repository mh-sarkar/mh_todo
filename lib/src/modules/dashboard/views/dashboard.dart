import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/src/shared/controller/home_controller.dart';
import 'package:todo/src/shared/shared_widgets/custom_sized_boxes.dart';
import 'package:todo/src/utils/constants/color_constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _todoController = TextEditingController();

  final _todoFocusNode = FocusNode();
  @override
  void dispose() {
    _todoController.dispose();
    _todoFocusNode.dispose();
    super.dispose();
  }

  void _onTodoAdd(){
    final now = DateTime.now();
    HomeController.to.createTodo(_todoController.text,now );
    _todoController.text = "";
    _todoFocusNode.unfocus();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu_open_rounded,
        ),
        actions: const [
          Icon(Icons.search_rounded),
          Icon(Icons.notifications_outlined),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadLineText(
                  headline: "What's up, Mehedi!",
                ),
                TitleText(title: "categories"),
                TitleText(title: "today's task"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _todoController,
                    focusNode: _todoFocusNode,
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.task_rounded),
                      fillColor: AppColors.kTitleTextColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                        borderSide: const BorderSide(
                          color: AppColors.kWhiteColor,
                          width: 1,
                        ),
                      ),
                    ),
                    onChanged: (val) {},
                    onFieldSubmitted: (val) {
                      _onTodoAdd();
                    },
                  ),
                ),
                CustomSizedBox.space8W,
                FloatingActionButton(
                  onPressed: _onTodoAdd,
                  child: const Icon(
                    Icons.add_rounded,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(
      //     Icons.add_rounded,
      //   ),
      // ),
    );
  }
}

class HeadLineText extends StatelessWidget {
  final String headline;
  const HeadLineText({
    super.key,
    required this.headline,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        headline.capitalize!,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  final String title;
  const TitleText({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
