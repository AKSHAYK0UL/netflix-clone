import 'package:flutter/material.dart';
import 'package:netflix/extras/noimage.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/screens/detailscreen.dart';

Widget buildShowAll({
  required BuildContext context,
  required List<ShowResponse> data,
  required String title,
}) {
  final screenSize = MediaQuery.sizeOf(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          childAspectRatio: 0.74,
          crossAxisSpacing: 5,
          mainAxisSpacing: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final dataObj = data[index];

          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(DetailScreen.routeName,
                  arguments: {"route": title, "data": dataObj});
            },
            child: Padding(
              padding: EdgeInsets.all(screenSize.height * 0.0105),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.circular(screenSize.height * 0.0158),
                    child: Container(
                      width: screenSize.height * 0.237,
                      height: screenSize.height * 0.320,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(screenSize.height * 0.0158),
                      ),
                      child: Stack(
                        children: [
                          Image.network(
                            dataObj.show?.image?.original ??
                                dataObj.show?.image?.medium ??
                                noImageUrl,
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: double.infinity,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    "assets/loadingImagebg.png",
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                  const CircularProgressIndicator(),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    ],
  );
}
