import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hospital/data/repo/radiograph_repo.dart';

part 'radiograph_state.dart';

class RadiographCubit extends Cubit<RadiographState> {
  RadiographCubit() : super(RadiographState.initial());

  var radiograph ;
  var not ;

  Future getRadiograph() async {
    emit(state.copyWith(radiographStatus: RadiographStatus.loading)) ;
    try {
      radiograph = await RadiographRepo.getRadiograph() ;
      emit(state.copyWith(radiographStatus: RadiographStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(radiographStatus: RadiographStatus.failure)) ;
    }
  }

  Future getRadiographNotification() async {
    emit(state.copyWith(radiographStatus: RadiographStatus.loading)) ;
    try {
      not = await RadiographRepo.getRadiographNotification() ;
      emit(state.copyWith(radiographStatus: RadiographStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(radiographStatus: RadiographStatus.failure)) ;
    }
  }

  Future readNot(int id) async {
    emit(state.copyWith(radiographStatus: RadiographStatus.notloading)) ;
    try {
      await RadiographRepo.makeNotRead(id) ;
      emit(state.copyWith(radiographStatus: RadiographStatus.notSuc)) ;
    } catch (e) {
      emit(state.copyWith(radiographStatus: RadiographStatus.failure)) ;
    }
  }

  Future addResponse(int id , PlatformFile image , PlatformFile pdf) async {
    emit(state.copyWith(radiographStatus: RadiographStatus.loading)) ;
    try {
      await RadiographRepo.addResponse(id, image, pdf);
      emit(state.copyWith(radiographStatus: RadiographStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(radiographStatus: RadiographStatus.failure)) ;
    }
  }
}
