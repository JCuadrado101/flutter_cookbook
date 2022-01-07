import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_provider.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_screen.dart';
import '../models/data_layer.dart';
import 'plan_provider.dart';

class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({Key? key}) : super(key: key);

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}

class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();
  
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }
    final plan = Plan()..name = text;
    PlanProvider.of(context)?.add(plan);
    textController.clear();
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }


  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: 'Add a plan',
            contentPadding: EdgeInsets.all(20.0)),
          onEditingComplete: addPlan,
        ),
      ),
    );
  }

  Widget _buildMasterPlans() {
    final plans = PlanProvider.of(context);

    if (plans!.isEmpty) {
      return Column(
        children: [
          const Icon(Icons.note, size: 100, color: Colors.grey),
          Text('No plans yet', style: Theme.of(context).textTheme.headline5),
        ]);
    }
    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlanScreen(plan: plan),
              ),
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Plans'),
      ),
      body: Column(
        children: [
          _buildListCreator(),
          Expanded(child: _buildMasterPlans())
        ],
      ),
    );
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}
