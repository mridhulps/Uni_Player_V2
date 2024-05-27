import 'package:get_it/get_it.dart';

import 'package:uni_player_2/core/permission_acess.dart';

import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';

final locator = GetIt.asNewInstance();

void getItconfigure() {
  locator.registerSingleton<BetterPermission>(BetterPermission());

  locator.registerSingleton<SongListServiceImp>(SongListServiceImp());
}
