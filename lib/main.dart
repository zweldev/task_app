import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_app/blocs/bloc_exports.dart';
import 'package:task_app/blocs/bloc_observer.dart';
import 'package:task_app/models/task.dart';
import 'package:task_app/services/app_router.dart';
import 'package:task_app/view/tasks_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = TaskApp_Observer();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp( TaskApp(appRouter: AppRouter(),));
}

class TaskApp extends StatelessWidget {
   TaskApp({super.key,required this.appRouter});

  AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<TaskBloc>(
        create: (context) => TaskBloc(),
        child: Task_Screen_EXP(),
      ),
      onGenerateRoute: appRouter.onGeneratedRoute,
    );
  }
}


//part 2 13:30