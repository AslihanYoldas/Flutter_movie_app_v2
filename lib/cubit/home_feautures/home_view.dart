// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movieapi_v2/view/home_success_view.dart';
import 'home_cubit.dart';
import 'home_states.dart';


class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          if (state is InitState) {


            BlocProvider.of<HomeCubit>(context).fetchHomePage();
            return buildLoading();

          } else if (state is LoadingState) {
            return buildLoading();

          } else if (state is ResponseState) {


            return HomeSuccess(state.news,state.popular,state.upcoming );
          }
          else {
            final error = state as ErrorState;
            return buildError(error);
          }

        },
      ),
    );
  }

  Center buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildError(ErrorState error) {
    return Center(
      child: Text(error.message),
    );
  }
}