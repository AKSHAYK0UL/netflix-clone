import 'package:flutter/material.dart';
import 'package:netflix/model/response.dart';
import 'package:netflix/ui/home/widgets/showall.dart';

class ShowAll extends StatelessWidget {
  static const routeName = "/showall";
  const ShowAll({super.key});

  @override
  Widget build(BuildContext context) {
    final routeData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final title = routeData['title'];
    final dataList = routeData['data'] as List<ShowResponse>;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.red),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: buildShowAll(context: context, data: dataList, title: title),
    );
  }
}
