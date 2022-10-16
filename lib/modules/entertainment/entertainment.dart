import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news/sheared/cubit/news_state.dart';

import '../../sheared/componant/artical.dart';
import '../../sheared/cubit/news_cubit.dart';

class EntertainmentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.entertainment.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return articalItem(cubit.entertainment[index], context);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: cubit.entertainment.length,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}
