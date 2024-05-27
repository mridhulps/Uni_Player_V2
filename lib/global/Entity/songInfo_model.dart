// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomSongModel {
  final String? songuri;
  final String title;
  final String artist;
  final int artworkid;
  final bool? isfavorite;
  final Image? image;

  CustomSongModel(
      {required this.songuri,
      required this.title,
      required this.artist,
      required this.artworkid,
      this.isfavorite,
      this.image});
}




class CurrentState {
  final int? artworkid;
  final String? title;

  CurrentState({this.artworkid, this.title});
}
