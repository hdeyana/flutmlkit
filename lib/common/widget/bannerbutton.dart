import 'package:flutter/material.dart';

class BannerButton extends StatelessWidget {
  final Function onTap;
  final String img;
  final String title;
  BannerButton({this.onTap, this.img, this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 3 / 1,
            child: Stack(
              children: <Widget>[
                Image.network(
                  img,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Container(
                  color: Colors.black45,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white),
                      ),
                      Icon(
                        Icons.navigate_next,
                        size: 36,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
