import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 280.0,
      color: Theme.of(context).primaryColor, //ask_hemanth
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  height: 55.0,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ],
          ),
          _SideMenuIconTab(
            iconData: Icons.home,
            title: 'Home',
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.search,
            title: 'Search',
            onTap: () {},
          ),
          _SideMenuIconTab(
            iconData: Icons.audiotrack,
            title: 'Radio',
            onTap: () {},
          ),
          const SizedBox(height: 12.0),
         _LibraryPlayLists(),
        ],
      ),
    );
  }
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;

  const _SideMenuIconTab({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,  //https://stackoverflow.com/questions/44579918/flutter-wrap-text-on-overflow-like-insert-ellipsis-or-fade
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlayLists extends StatefulWidget {
  @override
  __LibraryPlayListsState createState() => __LibraryPlayListsState();
}

class __LibraryPlayListsState extends State<_LibraryPlayLists> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
        padding: const EdgeInsets.symmetric(vertical : 12.0),
        physics: const ClampingScrollPhysics(), //*
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 16.0, vertical : 8.0),
                child: Text(
                  "YOUR LIBRARY",
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary.map((e) => ListTile(
                dense: true, 
                title: Text(e,style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis),
                onTap: () {},
                )
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal : 16.0, vertical : 8.0),
                child: Text(
                  "PLAYLISTS",
                  style: Theme.of(context).textTheme.headline4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...playlists.map((e) => ListTile(
                dense: true, 
                title: Text(e,style: Theme.of(context).textTheme.bodyText2, overflow: TextOverflow.ellipsis),
                onTap: () {},
                )
              ),
            ],
          )
        ]
      ),
    );
  }
}

