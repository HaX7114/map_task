import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Controllers/SourceScreenController/source_screen_states.dart';
import 'package:maps/Models/current_location.dart';

class SourceScreenCubit extends Cubit<SourceScreenStates> {
  SourceScreenCubit() : super(InitState());

  static SourceScreenCubit get(context) => BlocProvider.of(context);

  TextEditingController sourceTextController = TextEditingController();

  onChangeSourceTextField(String text) {
    String currentText = sourceTextController.text;
    if (currentText.isEmpty) {
      emit(EmptySearchingState());
    } else {
      emit(SearchingState());
    }
  }

  getSearchData(text) {
    return CurrentLocation.searchLocation(text);
  }
}
