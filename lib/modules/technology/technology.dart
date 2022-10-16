import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:news/sheared/cubit/news_state.dart';

import '../../sheared/componant/artical.dart';
import '../../sheared/cubit/news_cubit.dart';

class TechnologyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: cubit.technology.isNotEmpty,
          builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return articalItem(cubit.technology[index], context);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.grey,
              );
            },
            itemCount: cubit.technology.length,
          ),
          fallback: (context) => const Center(child: CircularProgressIndicator()),
        );
      },
      listener: (context, state) {},
    );
  }
}
