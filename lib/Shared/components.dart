// @dart=2.9

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';

import 'package:sql/web_view/web_view-screen.dart';

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigatetTo(
            context,
            WebViewScreen(
              url: article['url'],
            ));
      },
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(article['urlToImage'] != null
                      ? "${article['urlToImage']}"
                      : "https://thumbs.dreamstime.com/z/no-image-available-icon-photo-camera-flat-vector-illustration-132483141.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        "${article['title']}",
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      "${article['publishedAt']}",
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

Widget myDivider() => Padding(
      padding: EdgeInsets.all(10),
      child: Divider(
        color: Colors.grey,
      ),
    );

Widget article({  list,  isSearch=false,context}) {
  return ConditionalBuilder(
    condition: list != null,
    builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 20),
    fallback: (context) => isSearch ? Container():  Center(
      child: CircularProgressIndicator(),
    ),
  );
}

void navigatetTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
