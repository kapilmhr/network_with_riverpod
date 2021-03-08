import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/ApiUrl.dart';
import 'package:flutter_clean_architecture/model/Flower.dart';

class FlowerWidget extends StatelessWidget {
  Flower _flower;

  FlowerWidget(this._flower);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      child: Container(
          margin: EdgeInsets.only(bottom: 10, top: 10, right: 5),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20)),
          child: GestureDetector(
            onTap: () {
              // var all = context.read(futureProvider);
              // all.data.value.fold(() => null, () => null)
              // if(all.data.value.length == 34){
              //   print(all.data.value.length);
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: CachedNetworkImage(
                    imageUrl: ApiUrl.photosUrl+_flower.photo,
                    width: 110,
                    height: 90,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                            value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        Icon(Icons.error),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _flower.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ))
              ],
            ),
          )),
    );
  }
}
