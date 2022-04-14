import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Controllers/DestinationScreenController/destination_screen_cubit.dart';
import 'package:maps/Controllers/DestinationScreenController/destination_screen_states.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_cubit.dart';
import 'package:maps/Shared/CustomWidgets/my_text.dart';
import 'package:maps/Shared/CustomWidgets/my_text_field.dart';
import 'package:maps/Shared/CustomWidgets/state_fallback.dart';
import 'package:maps/Shared/Functions/navigation_functions.dart';

class DestinationScreen extends StatelessWidget {
  final HomeScreenCubit cubit;

  const DestinationScreen({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => DestinationScreenCubit(),
        child: BlocConsumer<DestinationScreenCubit, DestinationScreenStates>(
          listener: (context, state) {},
          builder: (context, state) {
            DestinationScreenCubit searchingPageCubit =
                DestinationScreenCubit.get(context);
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
                            condition: state is NoSearchesAvailableState,
                            builder: (context) => const FallbackWidget(
                                iconData: CupertinoIcons.exclamationmark_circle,
                                message: 'No search matches !'),
                            fallback: (context) => ConditionalBuilder(
                              condition: state is GotSearchingResultsState,
                              builder: (context) => Padding(
                                  padding: const EdgeInsets.only(
                                      top: K_mainPadding * 4),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        searchingPageCubit.results.length,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        onTap: () {
                                          cubit.setDestinationLocationObjData(
                                              searchingPageCubit
                                                  .results[index]);
                                          Navigator.pop(context);
                                        },
                                        leading: const CircleAvatar(
                                            child: Icon(Icons.location_on)),
                                        title: MyText(
                                            text: searchingPageCubit
                                                .results[index].name,
                                            size: K_fontSizeM),
                                        subtitle: MyText(
                                          text: searchingPageCubit
                                              .results[index].country,
                                          fontWeight: FontWeight.normal,
                                          color: K_blackColor.withOpacity(0.5),
                                          size: K_fontSizeM - 2,
                                        ),
                                      );
                                    },
                                  )),
                              fallback: (context) => const FallbackWidget(
                                  iconData: CupertinoIcons.search_circle,
                                  message:
                                      'The search results will shown here !'),
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
                        textController:
                            searchingPageCubit.destinationTextController,
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
