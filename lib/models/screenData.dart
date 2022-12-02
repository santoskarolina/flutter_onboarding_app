import 'package:flutter/material.dart';

class ScreenData {
  ScreenData({this.title, this.description, this.localImageSrc});

  String? title;
  String? description;
  String? localImageSrc;
}

final List<ScreenData> slides = [
  ScreenData(
    description:
        "LLorem Ipsum is simply dummy text of the printing and typesetting industry.",
    title: "Lorem Ipsum",
    localImageSrc: "assets/image01.png",
  ),
  ScreenData(
    description:
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
    title: "Lorem Ipsum",
    localImageSrc: "assets/image02.png",
  ),
  ScreenData(
    description:
        "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some.",
    title: "Lorem Ipsum",
    localImageSrc: "assets/image03.png",
  ),
];
