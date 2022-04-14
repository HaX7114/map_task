import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Constants/constants.dart';
import 'package:maps/Controllers/DestinationScreenController/destination_screen_states.dart';
import 'package:maps/Models/destination_location.dart';

class DestinationScreenCubit extends Cubit<DestinationScreenStates> {
  DestinationScreenCubit() : super(InitState());

  static DestinationScreenCubit get(context) => BlocProvider.of(context);

  TextEditingController destinationTextController = TextEditingController();

  List<Destination> results = destinations;

  onChangeSourceTextField(String text) {
    String currentText = destinationTextController.text;
    if (currentText.isEmpty) {
      emit(EmptySearchingState());
    } else {
      getSearchData(text);
    }
  }

  getSearchData(text) {
    results = Destination.searchLocation(text);
    if (results.isNotEmpty) {
      emit(GotSearchingResultsState());
    } else {
      emit(NoSearchesAvailableState());
    }
  }
}
