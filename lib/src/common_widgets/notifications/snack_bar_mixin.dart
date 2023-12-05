import 'package:flutter/material.dart';

mixin SnackBarMixin {
  void showSnackBar(
    BuildContext context,
    title,
    message,
    color,
  ) {
    print(MediaQuery.of(context).size.height);
    var notificationContent = <dynamic>[
      Text(
        title,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 19),
      ),
    ];
    if(message != null){
      notificationContent.add(const SizedBox(height: 3));
      notificationContent.add(Text(
        message,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 12),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ));
    }
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 380
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: const Duration(milliseconds: 2000),
      content: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
              padding: const EdgeInsets.all(16.0),
              height: message != null ? 90 : 60,
              decoration: BoxDecoration(
                color: color.withOpacity(0.7),
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        ...notificationContent
                      ],
                    ),
                  ),
                ],
              ),
          ),
          Positioned(
              right: 5,
              top: -12,
              child: InkWell(
                onTap: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: color, borderRadius: BorderRadius.circular(20.0)),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ))
        ],
      ),
      behavior: SnackBarBehavior.floating,
    ),

    );
  }
}
