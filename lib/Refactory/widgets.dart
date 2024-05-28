import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/app_Global_const/const.dart';
import 'package:uni_player_2/application/PlayListBloc/play_list_bloc_bloc.dart';
import 'package:uni_player_2/application/SongsAndPlayBloc/song_and_play_bloc.dart';
import 'package:uni_player_2/global/Entity/playlist_model.dart';
import 'package:uni_player_2/global/Entity/positionStream.dart';

import 'package:uni_player_2/global/domain/instances/instance.dart';
import 'package:uni_player_2/global/domain/streams/streams.dart';

import '../application/HomePagebloc/homepage_bloc.dart';

class CustomContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? radius;
  final Color? color;
  final bool borderEnable;
  final Function()? onpress;
  final Color bordercolor;
  final double borderwidth;
  final Widget? child;
  final bool? constraintrue;

  const CustomContainer(
      {super.key,
      this.width,
      this.height,
      this.radius,
      this.borderEnable = false,
      this.bordercolor = Colors.white,
      this.borderwidth = 0,
      this.color,
      this.onpress,
      this.child,
      this.constraintrue = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        (onpress != null) ? onpress!() : null;
      },
      child: Container(
        width: width,
        height: height,
        constraints: constraintrue == false
            ? null
            : const BoxConstraints(
                maxHeight: 80,
              ),
        decoration: BoxDecoration(
            color: color ?? Colors.white,
            borderRadius: BorderRadius.circular(radius ?? 10),
            border: borderEnable == true
                ? Border.all(color: bordercolor, width: borderwidth)
                : null),
        child: Center(child: child),
      ),
    );
  }
}

//TEXT REFACTOR WIDGET;
class CustomText extends StatelessWidget {
  final String string;
  final double? paddingright;
  final double? paddingleft;
  final double? paddingtop;
  final double? paddingbottom;
  final Color? color;
  final double? fontsize;
  final FontWeight? fontweight;
  final TextOverflow? overflow;
  final TextType texttype;
  //import googlefonts package;
  final FontType? fonttype;

  const CustomText({
    super.key,
    required this.string,
    this.paddingright,
    this.paddingleft,
    this.paddingtop,
    this.paddingbottom,
    this.color,
    this.fontsize,
    this.fontweight,
    this.overflow,
    this.fonttype = FontType.roboto,
    this.texttype = TextType.deFault,
  });

  @override
  Widget build(BuildContext context) {
    var text = Theme.of(context).textTheme;

    return Padding(
        padding: EdgeInsets.only(
            left: paddingleft ?? 0.0,
            right: paddingright ?? 0.0,
            top: paddingtop ?? 0.0,
            bottom: paddingbottom ?? 0.0),
        child: SizedBox(
          child: Text(string,
              style: (texttype == TextType.deFault)
                  ? TextStyle(
                      color: color ?? Colors.white,
                      fontSize: fontsize,
                      fontWeight: fontweight,
                      overflow: overflow,
                      fontFamily: fonttype == FontType.aboretofont
                          ? GoogleFonts.aboreto().fontFamily
                          : GoogleFonts.roboto().fontFamily)
                  : (texttype == TextType.titleLarge)
                      ? buildCopywith(text.bodyLarge)
                      : (texttype == TextType.titleMedium)
                          ? buildCopywith(text.bodyMedium)
                          : (texttype == TextType.titleSmall)
                              ? buildCopywith(text.bodySmall)
                              : (texttype == TextType.subtitleLarge)
                                  ? buildCopywith(text.labelLarge)
                                  : (texttype == TextType.subtitleMedium)
                                      ? buildCopywith(text.labelMedium)
                                      : buildCopywith(text.labelSmall)),
        ));
  }

  TextStyle buildCopywith(TextStyle? style) {
    if (style == null) {
      null;
    }

    return style!.copyWith(
        color: color ?? Colors.white,
        fontSize: fontsize,
        fontWeight: fontweight,
        overflow: overflow,
        fontFamily: fonttype == FontType.aboretofont
            ? GoogleFonts.aboreto().fontFamily
            : GoogleFonts.roboto().fontFamily);
  }
}

enum TextType {
  deFault,
  titleLarge,
  titleMedium,
  titleSmall,
  subtitleLarge,
  subtitleMedium,
  subtitleSmall
}

enum FontType { roboto, aboretofont }

// THIS WIDGET USE FOR SONG ARTWORK IMAGE USE IN FULL SCREEN AND MAINLY USE FOR ACCESS TO ERRORBUILDER METHODE;

Widget imageContainer({required Widget child, String? image, int? artworkId}) {
  return Container(
    child: image == null || image.isEmpty
        ? Center(
            child: child,
          )
        : Stack(fit: StackFit.expand, children: [
            Image(
                image: NetworkImage(image),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                      color: ConstColor.backgroundcolor,
                    )),
            Center(
              child: child,
            )
          ]),
  );
}

//ICON WIDGET;
Widget iconWidget({
  required IconData icon,
  double? size,
  Color color = Colors.white,
  double? paddingleft,
  double? paddingright,
}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft ?? 0, right: paddingright ?? 0),
    child: Icon(
      icon,
      size: size,
      color: color,
    ),
  );
}

//USE FOR ALL ELAVATION BUTTONS;
Widget materialButton({
  required Widget child,
  double? radius,
  Color? buttoncolor = Colors.white,
}) {
  return Material(
    elevation: 3,
    borderOnForeground: false,
    type: MaterialType.circle,
    color: Colors.white,
    child: CircleAvatar(
        backgroundColor: buttoncolor, radius: radius, child: child),
  );
}

Widget customButton(
    {String? name, VoidCallback? ontap, BuildContext? context}) {
  return ElevatedButton(
    style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.white)),
    onPressed: () {
      ontap != null ? ontap() : null;
    },
    child: CustomText(
      string: name ?? '',
      color: Colors.black,
    ),
  );
}

//USING FOR MULTIPLE TIME ;

mixin IndexstreamInstances {
  final player = Instances.audioplayer;
}

//TEXT STREAM CONTAINER;

class TitleAndArtistStream extends StatelessWidget with IndexstreamInstances {
  final StreamText streamtext;
  final TextType texttype;
  final double paddingtop;
  final double paddingbottom;
  final TextOverflow? overflow;

  TitleAndArtistStream(
      {super.key,
      this.streamtext = StreamText.title,
      this.texttype = TextType.deFault,
      this.paddingtop = 0.0,
      this.paddingbottom = 0.0,
      this.overflow});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongAndPlayBloc, SongAndPlayState>(
      builder: (context, bloc) {
        return StreamBuilder<int?>(
            stream: player.currentIndexStream,
            builder: (context, state) {
              if (state.data == null || state.hasError) {
                return CustomText(
                  string: streamtext == StreamText.title
                      ? 'Play Song'
                      : '<Unknown>',
                  paddingtop: paddingtop,
                  overflow: overflow,
                  paddingbottom: paddingbottom,
                  color: Colors.white,
                  fonttype: FontType.aboretofont,
                  texttype: texttype,
                  fontweight: FontWeight.bold,
                );
              } else {
                final currentstate = bloc.currentSongList[state.data!];
                final title = currentstate.title;
                final artist = currentstate.artist;
                return CustomText(
                  string: streamtext == StreamText.title ? title : artist,
                  paddingtop: paddingtop,
                  overflow: overflow,
                  paddingbottom: paddingbottom,
                  color: Colors.white,
                  fonttype: FontType.aboretofont,
                  texttype: texttype,
                  fontweight: FontWeight.bold,
                );
              }
            });
      },
    );
  }
}

enum StreamText { title, artist }

//ARTWORK STREAM CONTAINER;

class ArtworkStreamWidget extends StatelessWidget with IndexstreamInstances {
  final Widget? child;

  final StreamNullWidget? nullwiget;

  final double? musicnotesize;
  final Color? musicnotcolor;

  ArtworkStreamWidget(
      {super.key,
      this.child,
      this.nullwiget = StreamNullWidget.musicnote,
      this.musicnotcolor,
      this.musicnotesize = 0.0});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SongAndPlayBloc, SongAndPlayState>(
      buildWhen: (previous, current) {
        return previous.currentIndex != current.currentIndex;
      },
      builder: (context, states) {
        return Stack(fit: StackFit.expand, children: [
          StreamBuilder<int?>(
              stream: player.currentIndexStream,
              builder: (context, state) {
                if (state.data == null || state.hasError) {
                  if (nullwiget == StreamNullWidget.musicnote) {
                    return CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: iconWidget(
                          icon: Icons.music_note_rounded,
                          color: ConstColor.backgroundcolor,
                          size: 100),
                    );
                  } else {
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: ConstColor.backgroundcolor,
                    );
                  }
                  //NOT NULL SCENARIO;
                } else {
                  final id = states.currentSongList[state.data!].artworkid;

                  context
                      .read<SongAndPlayBloc>()
                      .add(AddCurrentIndexEvents(currentIndex: state.data!));

                  return onlyqueryArtwork(
                      artworkId: id,
                      nullwiget: nullwiget,
                      musicnotcolor: ConstColor.backgroundcolor,
                      musicnotesize: 100);
                }
              }),
          Center(
            child: child,
          )
        ]);
      },
    );
  }
}

enum StreamNullWidget { plain, musicnote }

//QUERYARTWORKIDGET;

Widget onlyqueryArtwork(
    {required int artworkId,
    StreamNullWidget? nullwiget,
    double? musicnotesize = 0.0,
    Color? musicnotcolor}) {
  return QueryArtworkWidget(
    id: artworkId,
    type: ArtworkType.AUDIO,
    artworkQuality: FilterQuality.high,
    artworkFit: BoxFit.fill,
    quality: 100,
    artworkBorder: BorderRadius.circular(20),
    nullArtworkWidget: nullwiget == StreamNullWidget.plain
        ? Container(
            color: ConstColor.backgroundcolor,
          )
        : CircleAvatar(
            backgroundColor: Colors.transparent,
            child: iconWidget(
                icon: Icons.music_note_rounded,
                color: musicnotcolor ?? Colors.white,
                size: musicnotesize),
          ),
    errorBuilder: (p0, p1, p2) {
      log('artworkErrorbuilder called, object(${p1.toString()}),stacktrace(${p2.toString()})');
      return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: iconWidget(
            icon: Icons.music_note_rounded,
            color: ConstColor.backgroundcolor,
            size: 100),
      );
    },
  );
}

//  REFACTOR NAVIGATOR

customNavigator(BuildContext context, Widget page) {
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: ((context) => page)));
}

//DROPDOWN MAIN WIDGET;

class CustomDropDownButton extends StatelessWidget {
  final Color? backgroundcolor;
  final List<PopupMenuEntry<dynamic>> customitem;
  final Widget? icon;
  const CustomDropDownButton(
      {super.key, required this.customitem, this.icon, this.backgroundcolor});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<dynamic>(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none),
        clipBehavior: Clip.antiAlias,
        color: backgroundcolor ?? ConstColor.backgroundcolor,
        elevation: 10,
        child: icon,
        itemBuilder: (context) => customitem);
  }
}

// REFACTOR TEXTFIELD;

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintname;

  const CustomTextField({super.key, this.controller, this.hintname});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 30),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            border: InputBorder.none,
            prefix: const SizedBox(
              width: 15,
            ),
            hintText: hintname,
            hintStyle: const TextStyle(
              fontSize: 15,
              color: Colors.black45,
            )),
      ),
    );
  }
}

validation(TextEditingController controller, BuildContext context) {
  final text = controller.text;

  if (text.isEmpty) {
    return;
  } else {
    final model = CustomPlayListModel(songList: [], playistName: text);

    context
        .read<PlayListBlocBloc>()
        .add(AddPlayListEvent(playlistmodel: model));

    controller.clear();
  }
}
