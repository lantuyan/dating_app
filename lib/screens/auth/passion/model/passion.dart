import 'package:flutter/material.dart';

class Interest {
  final int id;
  final String name;
  bool selected;
  final IconData icon;

  Interest({
    required this.id,
    required this.name,
    required this.selected,
    required this.icon,
  });
}

List<Interest> fakeInterests = [
  Interest(id: 1, name: 'Photography', selected: false, icon : Icons.camera_alt_outlined),
  Interest(id: 2, name: 'Shopping', selected: false , icon: Icons.shopping_bag_outlined),
  Interest(id: 3, name: 'Karaoke', selected: false , icon : Icons.mic_outlined),
  Interest(id: 4, name: 'Yoga', selected: false , icon : Icons.self_improvement_outlined),
  Interest(id: 5, name: 'Cooking', selected: false , icon : Icons.restaurant_outlined),
  Interest(id: 6, name: 'Tennis', selected: false , icon : Icons.sports_tennis_outlined),
  Interest(id: 7, name: 'Running', selected: false , icon : Icons.run_circle_outlined),
  Interest(id: 8, name: 'Swimming', selected: false , icon :  Icons.pool_outlined),
  Interest(id: 9, name: 'Art', selected: false , icon :   Icons.palette_outlined),
  Interest(id: 10, name: 'Traveling', selected: false , icon :  Icons.airplanemode_active_outlined),
  Interest(id: 11, name: 'Extreme', selected: false , icon :  Icons.sports_esports_outlined),
  Interest(id: 12, name: 'Music', selected: false , icon :  Icons.music_note_outlined),
  Interest(id: 13, name: 'Drinking', selected: false , icon :   Icons.local_bar_outlined),
  Interest(id: 14, name: 'VideoGames', selected: false , icon :   Icons.videogame_asset_outlined),
  Interest(id: 15, name: 'Traveling', selected: false , icon :  Icons.airplanemode_active_outlined),
  Interest(id: 16, name: 'Extreme', selected: false , icon :  Icons.sports_esports_outlined),
  Interest(id: 17, name: 'Music', selected: false , icon :  Icons.music_note_outlined),
  Interest(id: 18, name: 'Drinking', selected: false , icon :   Icons.local_bar_outlined),
  Interest(id: 19, name: 'VideoGames', selected: false , icon :   Icons.videogame_asset_outlined),
];
