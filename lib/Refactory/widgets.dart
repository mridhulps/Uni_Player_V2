import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';

import 'package:uni_player_2/app_Global_const/const.dart';

import 'package:uni_player_2/global/Locator/locator.dart';
import 'package:uni_player_2/global/Usecase/songlist_serviceImp.dart';
import 'package:uni_player_2/global/domain/instances/instance.dart';

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

enum ImageType { defaulte, image, artworkId }

// Widget imageContainer2(
//     {required Widget child,
//     String? image,
//     int? artworkId,
//     ImageType imagetype = ImageType.defaulte}) {
//   return Container(
//       child: imagetype == ImageType.defaulte
//           ? (image == null || image.isNotEmpty || artworkId != null)
//               ? throw Exception('image type is defaulte')
//               : Center(
//                   child: child,
//                 )
//           : imagetype == ImageType.image
//               ? (image == null || image.isEmpty)
//                   ? throw Exception('image is null')
//                   : Stack(fit: StackFit.expand, children: [
//                       Image(
//                           image: NetworkImage(image),
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) =>
//                               Container(
//                                 color: ConstColor.backgroundcolor,
//                               )),
//                       Center(
//                         child: child,
//                       )
//                     ])
//               : imagetype == ImageType.artworkId
//                   ? (artworkId == null)
//                       ? Stack(fit: StackFit.expand, children: [
//                           onlyqueryArtwork(artworkId: artworkId!),
//                           Center(
//                             child: child,
//                           )
//                         ])
//                       : Stack(fit: StackFit.expand, children: [
//                           onlyqueryArtwork(artworkId: artworkId),
//                           Center(
//                             child: child,
//                           )
//                         ])
//                   : Container());
// }

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
    this.fonttype = FontType.aboretofont,
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
        child: Text(string,
            style: (texttype == TextType.deFault)
                ? TextStyle(
                    color: color,
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
                                    : buildCopywith(text.labelSmall)));
  }

  TextStyle buildCopywith(TextStyle? style) {
    if (style == null) {
      null;
    }

    return style!.copyWith(
        color: color,
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

//ICON WIDGET;
Widget iconWidget({
  required IconData icon,
  double? size,
  Color color = Colors.white,
  double? paddingleft,
  double? paddingright,
  Function()? ontap,
}) {
  return Padding(
    padding: EdgeInsets.only(left: paddingleft ?? 0, right: paddingright ?? 0),
    child: InkWell(
      onTap: ontap,
      child: Icon(
        icon,
        size: size,
        color: color,
      ),
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

//USING FOR MULTIPLE TIME ;

mixin IndexstreamInstances {
  final player = locator.get<Instances>().audioplayer;
  final list = locator.get<SongListServiceImp>().songlist;
}

//TEXT STREAM CONTAINER;

class TextStreamwidget extends StatelessWidget with IndexstreamInstances {
  final StreamText streamtext;
  TextStreamwidget({
    super.key,
    this.streamtext = StreamText.title,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int?>(
        stream: player.currentIndexStream,
        builder: (context, state) {
          if (state.data == null || state.hasError) {
            return CustomText(
              string: streamtext == StreamText.title ? 'Play Song' : 'Unknown',
              color: Colors.white,
              fonttype: FontType.aboretofont,
              texttype: TextType.titleMedium,
              fontweight: FontWeight.bold,
            );
          } else {
            final title = list[state.data!].displayNameWOExt;
            final artist = list[state.data!].artist;
            return CustomText(
              string: streamtext == StreamText.title ? title : artist!,
              color: Colors.white,
              fonttype: FontType.aboretofont,
              texttype: TextType.titleMedium,
              fontweight: FontWeight.bold,
            );
          }
        });
  }
}

enum StreamText { title, artist }

//ARTWORK STREAM CONTAINER;

// ignore: must_be_immutable
class ArtworkStreamWidget extends StatelessWidget with IndexstreamInstances {
  Widget? child;

  StreamNullWidget? nullwiget;

  ArtworkStreamWidget(
      {super.key, this.child, this.nullwiget = StreamNullWidget.musicnote});

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      StreamBuilder<int?>(
          stream: player.currentIndexStream,
          builder: (context, state) {
            //   log(state.data.toString());
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
            } else {
              final id = list[state.data!].id;
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
