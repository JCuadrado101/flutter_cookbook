import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_provider.dart';
import '../models/data_layer.dart';

class PlanScreen extends StatefulWidget {
  Plan? plan;
  PlanScreen({Key? key, this.plan}) : super(key: key);

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan? get plan => widget.plan;

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
       setState(() {
         plan?.tasks.add(Task());
       });
      },
    );
  }

  Widget _buildTaskTile(Task? task) {
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final controller = PlanProvider.of(context);
        controller?.deleteTask(plan!, task!);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task?.complete,
          onChanged: (selected) {
            setState(() {
              task?.complete = selected!;
            });
          },
        ),
        title: TextField(
          onChanged: (text) {
            setState(() {
              task?.description = text;
            });
          },
        )
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: plan?.tasks.length,
      itemBuilder: (context, index) =>
      _buildTaskTile(plan?.tasks[index]),
    );
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async {
        final controller = PlanProvider.of(context);
        controller?.savePlan(plan!);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Master Plan')),
        body: Column(
          children: [
            Expanded(child: _buildList()),
            SafeArea(child: Text(plan!.completenessMessage))
          ],
        ),
        floatingActionButton: _buildAddTaskButton(),
      ),
    );
  }
}
