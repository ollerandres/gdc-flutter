import 'package:flutter/material.dart';
import 'package:gdgcordobaflutter/data/followers/follower.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultItem extends StatelessWidget {
  final Follower follower;

  const SearchResultItem({Key key, @required this.follower}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
      padding: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: ListTile(
          contentPadding: EdgeInsets.all(16.0),
          title: Text("${follower.login}",
              style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'SourceSansPro',
                  fontWeight: FontWeight.w800)),
          leading: CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(follower.avatar_url)),
          onTap: () async {
            if (await canLaunch(follower.html_url)) {
              await launch(follower.html_url);
            }
          }),
    );
  }
}
