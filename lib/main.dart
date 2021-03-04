import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_flutter/bloc/blocs.dart';
import 'package:whatsapp_flutter/services/services.dart';
import 'package:whatsapp_flutter/shared/shared.dart';
import 'package:whatsapp_flutter/ui/pages/pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
        value: Authservices.userStream,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PageBloc(OnInitialPage())),
            BlocProvider(create: (_) => UserBloc(UserInitial())),
          ],
          child: MaterialApp(
            theme: ThemeData(primaryColor: tealGreen, cursorColor: tealGreen),
            debugShowCheckedModeBanner: false,
            title: "Whatsapp Flutter",
            home: Wrapper(),
          ),
        ));
  }
}
