import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/src/shared/controller/home_controller.dart';
import 'package:todo/src/shared/shared_widgets/custom_sized_boxes.dart';
import 'package:todo/src/utils/constants/color_constants.dart';
import 'package:todo/src/utils/global/global.dart';

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

  void _onTodoAdd() {
    final now = DateTime.now();
    HomeController.to.createTodo(_todoController.text, now);
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeadLineText(
                  headline: "What's up, Mehedi!",
                ),
                // const TitleText(title: "categories"),
                CustomSizedBox.space16H,
                const TitleText(title: "today's task"),
                Expanded(
                  child: Obx(
                    () => ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: HomeController.to.todoList.length,
                      itemBuilder: (context, index) {
                        final todoItem = HomeController.to.todoList[index];
                        return Dismissible(
                          key: Key(todoItem.id!),
                          background: Container(color: Colors.red),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            // setState(() {
                            //   items.removeAt(index);
                            // });
                            HomeController.to.removeTodo(todoItem);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("\"${todoItem.title}\" dismissed"),
                              ),
                            );
                          },
                          child: GestureDetector(
                            onTap: () {
                              globalLogger.d(todoItem.completeStatus!);
                              final todo = todoItem;
                              todo.completeStatus = todo.completeStatus == '1' ? '0' : '1';
                              HomeController.to.updateTodo(todo);
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                color: AppColors.kBoxColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      globalLogger.d(todoItem.completeStatus!);
                                      final todo = todoItem;
                                      todo.completeStatus = todo.completeStatus == '1' ? '0' : '1';
                                      HomeController.to.updateTodo(todo);
                                    },
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: todoItem.completeStatus == '0'
                                            ? Colors.transparent
                                            : todoItem.type == '0'
                                                ? AppColors.kTitleTextColor
                                                : AppColors.kAccentColor,
                                        borderRadius: BorderRadius.circular(100),
                                        border: todoItem.completeStatus == '0'
                                            ? Border.all(
                                                color: todoItem.type == '0'
                                                    ? AppColors.kTitleTextColor
                                                    : AppColors.kAccentColor,
                                              )
                                            : null,
                                      ),
                                      child: todoItem.completeStatus == '1'
                                          ? const Icon(
                                              Icons.check_rounded,
                                              color: Colors.white,
                                              size: 10,
                                            )
                                          : const SizedBox(),
                                    ),
                                  ),
                                  CustomSizedBox.space4W,
                                  Expanded(
                                    child: Text(
                                      todoItem.title!,
                                      style: TextStyle(
                                          decoration:
                                              todoItem.completeStatus == '1' ? TextDecoration.lineThrough : null),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
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
