import 'package:flutter/material.dart';
import 'package:flutter_cookbook/chapter6/lib/plan_creator_screen.dart';
import 'package:flutter_cookbook/chapter7/navigation_first.dart';
import 'chapter3/basic_screen.dart';
import 'chapter3/immutable_widget.dart';
import 'chapter4/flex_screen.dart';
import 'chapter4/profile_screen.dart';
import 'chapter5/login_screen.dart';
import 'chapter5/stop_watch.dart';
import 'chapter6/lib/master_plan_app.dart';
import 'chapter7/future_page.dart';
import 'chapter7/geo_location.dart';
import 'chapter7/navigation_dialog.dart';
import 'chapter8/secure_storage.dart';
import 'chapter8/path_provider.dart';
import 'chapter8/shared_preferences.dart';
import 'chapter8/store_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StoreData();
  }
}
