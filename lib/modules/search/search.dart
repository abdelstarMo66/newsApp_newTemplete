import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/sheared/componant/artical.dart';

import '../../sheared/cubit/news_cubit.dart';
import '../../sheared/cubit/news_state.dart';

class SearchScreen extends StatelessWidget {
  var searchCon = TextEditingController();
  late String values;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchCon,
                  style: const TextStyle(color: Colors.black87),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(),
                    ),
                    label: Text(
                      'Search',
                      style: TextStyle(color: Colors.grey),
                    ),
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.grey,
                    ),
                    fillColor: Color(0xFFFBF2CF),
                    filled: true,
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'must not be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    NewsCubit.get(context).getSearch(searchText: value);
                  },
                  onChanged: (value) {
                    values = value;
                  },
                ),
              ),
              MaterialButton(
                onPressed: () {
                  NewsCubit.get(context).getSearch(searchText: values);
                },
                color: const Color(0xFFFBF2CF),
                child: const Text(
                  'Search',
                  style: TextStyle(color: Colors.teal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        articalItem(NewsCubit.get(context).search[index], context),
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      color: Colors.grey,
                    ),
                    itemCount: NewsCubit.get(context).search.length,
                  ),),
            ],
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
