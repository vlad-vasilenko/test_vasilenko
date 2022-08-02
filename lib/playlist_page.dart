import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_vasilenko/play_list.dart';
import 'package:test_vasilenko/request.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({Key? key}) : super(key: key);

  @override
  State<PlaylistPage> createState() => _PlaylistPageState();
}

class _PlaylistPageState extends State<PlaylistPage> {
  final Request request = Request();
  Future<String>? _future;
  String playlistName = '';
  String playlistDescription = '';
  String playlistPhoto = '';
  List playlist = [];
  bool loading = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future<String> _getData() async {
    setState(() => loading = true);
    var response = await request.fetchAlbum();
    Map<String, dynamic> data = jsonDecode(response.body.toString());
    setState(() {
      playlistName = data['name'];
      playlistDescription = data['description'];
      playlistPhoto = data['images'][0]['url'];
      playlist = data['tracks']['items'];
      setState(() => loading = false);
    });
    return _future = Future.value(playlistPhoto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              return snapshot.hasData && !loading
                  ? RefreshIndicator(
                      onRefresh: _getData,
                      child: ListView(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .5,
                            child: Image.network(playlistPhoto),
                          ),
                          SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              playlistName,
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              playlistDescription,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Playlist(playlist: playlist),
                        ],
                      ),
                    )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
