import 'package:uni_player_2/global/Entity/positionStream.dart';

import 'package:rxdart/rxdart.dart';
import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

Stream<PositionDataStream> get positionDataStream {
  final player = locator.get<Instances>().audioplayer;

  return Rx.combineLatest2<Duration, Duration?, PositionDataStream>(
      player.positionStream,
      player.durationStream,
     
      (position, duration) => PositionDataStream(
          positionsstream: position,
          durationstream: duration ?? Duration.zero,
          ));
}
