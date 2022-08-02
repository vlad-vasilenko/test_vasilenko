import 'package:http/http.dart' as http;

class Request {
  Map<String, String> get headers => {
        'accept': 'application/json',
        'accept-language': 'ru',
        'app-platform': 'WebPlayer',

        /// If the [authorization] token expired set new one
        'authorization': 'Bearer BQBNoM4RqPn6xHb0bzpGl2kXc2TZEebwSe6Zm3gG8rbu2EJr8qR28dRp8IRVEt_zwOLKzMJLfzme3Dsfg28SVDgeAGrwZFyCXV5m2l26p5MXOiMpd6k',

        /// If the [client-token] token expired set new one
        'client-token': 'AABSn89VepHR56YwsAjD9Wd4zQ3OujtkjJS/zwnb/u8o/zx4DZfTIHKb6cmcl44mpr/YCtRNotdBHRs4KrnoLK++QyWOWofewqConRCd0bChLH9QBI0y33j2BvXisIg2mBvEXeS3tOGguEwfx0yeqGJIOc7CzrKkB7ZXpdcCu1kwl39P2bBsOx93FLGv1bka0ZEc2fGXLU70yivZYEWw1riXcxrHfpk+hU9YQd5+cNwTLi6TVIHP/T3QH52F73jH0cOKN4ZsOKfgjxCfAqG0vO5JxUPTrpsALVL7kA==',

        'Referer': ' https://open.spotify.com/',
        'sec-ch-ua': '\".Not/A)Brand\";v=\"99\", \"Google Chrome\";v=\"103\", \"Chromium\";v="\103\"',
        'sec-ch-ua-mobile': '?0',
        'sec-ch-ua-platform': "macOS",
        'spotify-app-version': '1.1.92.65.gcb9055d3',
      };

  Future fetchAlbum() {
    String token = '896d4f52c589547b2134bd75ed48742db637fa51810b49b607e37e46ab2c0043';

    String url = 'https://api.spotify.com/v1/playlists/3dpOdyAk3AVSSc0CqXQEA6?fields=collaborative%2Cdescription%2Cfollowers%28total%29%2Cimages%2Cname%2Cowner%28display_name%2Cid%2Cimages%2Curi%29%2Cpublic%2Ctracks%2Curi&additional_types=track%2Cepisode&offset=0&limit=25&market=UA';
    return http.get(Uri.parse(url), headers: headers);
  }
}
