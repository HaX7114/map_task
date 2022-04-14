import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maps/Controllers/HomeScreenController/home_screen_states.dart';
import 'package:maps/Models/current_location.dart';
import 'package:maps/Models/destination_location.dart';

class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(InitState());

  static HomeScreenCubit get(context) => BlocProvider.of(context);

  CurrentLocation currentLocation = CurrentLocation(
    name: 'Your location',
    latitude: 0.0,
    longitude: 0.0,
  ); //Default value
  Destination destination = Destination(
    country: '',
    name: 'Destination',
    latitude: 0.0,
    longitude: 0.0,
  ); //Default value

  setCurrentLocationObjData(CurrentLocation objData) {
    currentLocation = objData;
    emit(CurrentLocationSetDataState());
  }

  setDestinationLocationObjData(Destination objData) {
    destination = objData;
    emit(DestinationLocationSetDataState());
  }
}
