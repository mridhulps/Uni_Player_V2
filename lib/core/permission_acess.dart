// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:uni_player_2/application/SongListbloc/song_list_bloc.dart';

class BetterPermission {
  Future status(Permission permissionstat, BuildContext context) async {
    if (await permissionstat.isGranted) {
      print('granded');

      BlocProvider.of<SongListBloc>(context).add(GetSonglist());
    } else if (await permissionstat.isDenied) {
      print('denied');

      final stat = await permissionstat.request();

      if (stat.isGranted) {
        BlocProvider.of<SongListBloc>(context).add(GetSonglist());
      } else {
        BlocProvider.of<SongListBloc>(context).add(DeniedPermission());
      }
    } else {
      print('permanent denied');

      final istrue = await openAppSettings();

      if (istrue == true) {
        BlocProvider.of<SongListBloc>(context).add(GetSonglist());
      } else {
        BlocProvider.of<SongListBloc>(context).add(PermenentDeniedPermission());
      }
    }
  }
}

enum PermissionType {
  initial,
  granded,
  denied,
  permanentdenied,
}

class PermissionBox {
  Future<PermissionType> status(
      Permission permissionstat, BuildContext context) async {
    PermissionType access = PermissionType.initial;

    if (!await permissionstat.isGranted) {
      final grand = await permissionstat.request();

      if (grand.isGranted) {
        access = PermissionType.granded;
      } else {
        access = PermissionType.denied;
      }
    } else if (await permissionstat.isDenied ||
        await permissionstat.isPermanentlyDenied) {
      access = PermissionType.denied;
    }
    return access;
  }
}
