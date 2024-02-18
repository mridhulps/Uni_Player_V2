import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';

part 'song_list_event.dart';
part 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  SongListBloc() : super(SongListInitial()) {
    on<GrandedPermission>((event, emit) => grandedpermission(event, emit));

    on<DeniedPermission>((event, emit) => deniedPermission(event, emit));

    on<PermenentDeniedPermission>(
        (event, emit) => permenentDeniedPermission(event, emit));

    on<GetSonglist>((event, emit) => getSongList(event, emit));
  }

  //REQUIST PERMISSION METHODE;
  grandedpermission(
      GrandedPermission event, Emitter<SongListState> emit) async {
    return emit(state.copyWith(permissiontype: PermissionType.granded));
  }

  deniedPermission(DeniedPermission event, Emitter<SongListState> emit) {
    return emit(state.copyWith(permissiontype: PermissionType.denied));
  }

  permenentDeniedPermission(
      PermenentDeniedPermission event, Emitter<SongListState> emit) {
    return emit(state.copyWith(permissiontype: PermissionType.permanentdenied));
  }

  // GET SONGLIST MODEL FROM PACKAGE;
  getSongList(GetSonglist event, Emitter<SongListState> emit) async {
    // OnAudioQuery querysong = OnAudioQuery();

    // final songlist = await querysong.querySongs(
    //     sortType: SongSortType.DATE_ADDED,
    //     orderType: OrderType.DESC_OR_GREATER,
    //     uriType: UriType.EXTERNAL,
    //     ignoreCase: true);

    // return emit(state.copyWith(
    //     isFailures: false, isloadings: false, songlist: songlist));

    emit(state.copyWith(
        isloadings: true, permissiontype: PermissionType.granded));

    final songlist = await locator.get<SongListServiceImp>().getSongList();

    songlist.fold((error) {
      return emit(
          state.copyWith(isFailures: true, isloadings: false, songlist: []));
    }, (list) async {
      emit(
          state.copyWith(isFailures: false, isloadings: false, songlist: list));
    });
  }
}
