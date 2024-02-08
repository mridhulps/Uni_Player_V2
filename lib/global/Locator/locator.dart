import 'package:get_it/get_it.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';

import 'package:uni_player_2/global/domain/InitialObjects/initialobjects.dart';

final locator = GetIt.asNewInstance();

void getItconfigure() {
  locator.registerSingleton<InitialObjects>(InitialObjects());

  locator.registerSingleton<SongListServiceImp>(SongListServiceImp());
}
