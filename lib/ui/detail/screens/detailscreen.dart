import 'package:flutter/material.dart';
import 'package:netflix/extras/noimage.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/detail/widgets/buildimage.dart';
import 'package:netflix/ui/detail/widgets/buildinfo.dart';

class DetailScreen extends StatefulWidget {
  static const routeName = "/detail";
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreen();
}

class _DetailScreen extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final route = routeData['route'];
    final data = routeData['data'] as ShowResponse;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildImage(
                context,
                data.show?.image?.original ??
                    data.show?.image?.medium ??
                    noImageUrl,
              ),
              buildInfo(context, data, route),
            ],
          ),
        ),
      ),
    );
  }
}
