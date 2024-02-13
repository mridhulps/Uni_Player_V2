import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uni_player_2/core/permission_acess.dart';
import 'package:uni_player_2/global/Locator/locator.dart';

part 'song_list_event.dart';
part 'song_list_state.dart';

class SongListBloc extends Bloc<SongListEvent, SongListState> {
  SongListBloc() : super(SongListInitial()) {
    on<PermissionAccess>((event, emit) => permissionStatus(event, emit));

    on<GetSonglist>((event, emit) => getSongList(event, emit));
  }

  //REQUIST PERMISSION METHODE;
  permissionStatus(PermissionAccess event, Emitter<SongListState> emit) async {
    final context = event.context;
    final perm = locator.get<StatPermissions>();

    final type = await perm.status(Permission.storage);

    if (type == PermissionType.granded) {
      emit(state.copyWith(isloadings: true));

      // ignore: use_build_context_synchronously
      context.read<SongListBloc>().add(GetSonglist());

      return emit(state.copyWith(
          isloadings: false, permissiontype: PermissionType.granded));
    } else if (type == PermissionType.denied) {
      await openAppSettings();

      return emit(state.copyWith(
          isloadings: false, permissiontype: PermissionType.denied));
    } else {
      return emit(state.copyWith(
          isloadings: false, permissiontype: PermissionType.permanentdenied));
    }
  }

  // GET SONGLIST MODEL FROM PACKAGE;
  getSongList(GetSonglist event, Emitter<SongListState> emit) async {}
}
