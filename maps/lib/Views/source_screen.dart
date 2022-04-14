import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_cubit.dart';
import 'package:maps/Controllers/SourceScreenController/source_screen_cubit.dart';
import 'package:maps/Controllers/SourceScreenController/source_screen_states.dart';
import 'package:maps/Models/current_location.dart';
import 'package:maps/Shared/CustomWidgets/my_text.dart';
import 'package:maps/Shared/CustomWidgets/my_text_field.dart';
import 'package:maps/Shared/Functions/navigation_functions.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class SourceScreen extends StatelessWidget {
  final HomeScreenCubit cubit;

  const SourceScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SourceScreenCubit(),
        child: BlocConsumer<SourceScreenCubit, SourceScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SourceScreenCubit searchingPageCubit =
                SourceScreenCubit.get(context);
            return Scaffold(
              backgroundColor: K_whiteColor,
              appBar: AppBar(
                backgroundColor: K_transColor,
                elevation: 0.0,
                leading: IconButton(
                  color: K_blackColor,
                  onPressed: () {
                    NavigationFunctions.navigateBack(context);
                  },
                  icon: const Icon(CupertinoIcons.back),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: K_mainPadding),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ConditionalBuilder(
                            condition: state is SearchingState,
                            builder: (context) => Padding(
                              padding:
                                  const EdgeInsets.only(top: K_mainPadding * 4),
                              child: PaginateFirestore(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilderType: PaginateBuilderType.listView,
                                itemBuilder:
                                    (context, documentSnapshots, index) {
                                  dynamic data =
                                      documentSnapshots[index].data();
                                  CurrentLocation currentLocation =
                                      CurrentLocation(
                                    name: data['name'],
                                    latitude: data['latitude'],
                                    longitude: data['longitude'],
                                  );
                                  return ListTile(
                                    onTap: () {
                                      cubit.setCurrentLocationObjData(
                                          currentLocation);
                                      Navigator.pop(context);
                                    },
                                    leading: const CircleAvatar(
                                        child: Icon(Icons.location_on)),
                                    title: MyText(
                                      text: data['name'],
                                      size: K_fontSizeM,
                                    ),
                                    subtitle: MyText(
                                      text: 'Armenia',
                                      fontWeight: FontWeight.normal,
                                      color: K_blackColor.withOpacity(0.5),
                                      size: K_fontSizeM - 2,
                                    ),
                                  );
                                },
                                onError: (exception) {
                                  return MyText(
                                    text: 'Check your connection !',
                                    size: K_fontSizeM,
                                  );
                                },
                                onEmpty: MyText(
                                  text: 'There is no search results !',
                                  size: K_fontSizeM,
                                ),
                                query: searchingPageCubit.getSearchData(
                                    searchingPageCubit
                                        .sourceTextController.text),
                                itemsPerPage: 10,
                              ),
                            ),
                            fallback: (context) => Padding(
                              padding:
                                  const EdgeInsets.only(top: K_mainPadding * 5),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Icon(CupertinoIcons.search_circle,
                                        size: 80, color: Colors.blue),
                                    K_vSpace20,
                                    MyText(
                                        text:
                                            'Search results will shown here !',
                                        fontWeight: FontWeight.normal,
                                        size: K_fontSizeM),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(boxShadow: shadow),
                      child: MyTextField(
                        borderColor: K_whiteColor,
                        backColor: K_whiteColor,
                        validatorText: '',
                        hintText: 'Search here',
                        textController: searchingPageCubit.sourceTextController,
                        onChange: (text) {
                          searchingPageCubit.onChangeSourceTextField(text);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
