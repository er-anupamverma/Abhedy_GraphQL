import 'package:abhedy_banking_project/core/constants/color_constants.dart';
import 'package:abhedy_banking_project/features/presentation/bloc/auth_status/auth_status_bloc.dart';
import 'package:abhedy_banking_project/features/presentation/pages/login/login_page.dart';
import 'package:abhedy_banking_project/features/presentation/pages/main/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashSubpage extends StatefulWidget {
  const SplashSubpage({super.key});

  @override
  State<StatefulWidget> createState() => SplashSubpageState();
}

class SplashSubpageState extends State<SplashSubpage> {
  @override
  void initState() {
    BlocProvider.of<AuthStatusBloc>(context).add(GetCustomerAuthStatusEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: const Size(360, 640),  minTextAdapt: true,  splitScreenMode: true);

    return BlocListener(
      bloc: BlocProvider.of<AuthStatusBloc>(context),
      listener: (context, state) {
        if(state is CustomerIsAuthenticated)
          {
            context.go("/${MainPage.id}");
          }
        else if(state is CustomerIsNotAuthenticated)
          {
            context.go("/${LoginPage.id}");
          }
      },
      child:  Scaffold(
        backgroundColor:kPrimaryColour,
        body: Center(
          child: Text("Welcome"),
        ),
      ),
    );
  }
}
