import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/modules/search/search.dart';
import 'package:news/sheared/cubit/news_cubit.dart';
import '../sheared/cubit/news_state.dart';

class Layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Extra Time',
            ),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
              }, icon: const Icon(Icons.search))
            ],
          ),
          drawer: Drawer(
            width: MediaQuery.of(context).size.width / 1.4,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "TOPIC",
                            style: GoogleFonts.pacifico().copyWith(
                              fontSize: 38.0,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            cubit.ChangeMode();
                          },
                          icon: Icon(cubit.DarkLightMode,size: 30.0,),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Container(
                      color: Colors.grey,
                      height: 1.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.topicDrawer.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(
                            cubit.topicDrawer[index],
                            style: GoogleFonts.combo().copyWith(
                              color: Colors.black,
                              fontSize: 38.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            cubit.changeScreen(index);
                          },
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 5.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: cubit.bodyScreen,
        );
      },
    );
  }
}
