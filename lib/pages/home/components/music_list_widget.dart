import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pulse_play_mobile_app/pages/home/components/music_list_item.dart';
import 'package:pulse_play_mobile_app/pages/home/components/search_result_item.dart';
import 'package:pulse_play_mobile_app/pages/home/controller/home_controller.dart';

class MusicListWidget extends GetWidget<HomeController> {
  final int itemCount;
  final List musicList;
  final bool isSearch;

  const MusicListWidget(this.itemCount, this.musicList, this.isSearch, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          final dynamic music = musicList[index];

          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: isSearch
                  ? SearchResultItem(
                      music: music,
                    )
                  : MusicListItem(
                      music: music,
                    ));
        });
  }
}
