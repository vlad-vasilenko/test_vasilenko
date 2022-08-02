import 'package:flutter/material.dart';

class Playlist extends StatelessWidget {
  final List playlist;

  const Playlist({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          playlist.length,
          (index) {
            String songImage = playlist[index]['track']['album']['images'][0]['url'];
            return InkWell(
              onTap: () {
                String image = playlist[index]['track']['album']['images'][0]['url'];
                // Navigator.push(context, MaterialPageRoute<void>(builder: (BuildContext context) {
                //   return MyPhotoScreen(url: url);
                // }));
              },
              child: Container(
                color: Colors.grey[200],
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('${(index + 1)}'),
                        SizedBox(width: 10),
                        Container(
                          height: 50,
                          width: 50,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(shape: const CircleBorder(), color: Colors.grey[400]),
                          child: Image.network(songImage, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * .5,
                              child: Text(
                                '${playlist[index]['track']['album']['name']}',
                                style: const TextStyle(fontSize: 17),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Text(
                                  '${playlist[index]['track']['album']['artists'][0]['name']}',
                                  style: const TextStyle(fontSize: 16),
                                ),
                                Text(
                                  playlist[index]['track']['album']['artists'].length > 1
                                      ? '${playlist[index]['track']['album']['artists']?[1]['name']}'
                                      : '',
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
