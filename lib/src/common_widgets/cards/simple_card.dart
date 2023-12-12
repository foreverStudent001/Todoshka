import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleCard extends StatelessWidget {
  SimpleCard({
    required this.title,
    required this.description,
    required this.date,
    required this.onTap,
  });

  final String title;
  final String description;
  final String date;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        elevation: 7,
        shadowColor: Colors.grey,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  flex: 2,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title,
                            softWrap: false,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Flexible(
                  flex: 4,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(description,
                            softWrap: false,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.0,
                            ),
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Flexible(
                  flex: 1,
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(date,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: 1.0,
                                color: BlocProvider.of<GlobalBlocs>(context)
                                            .state
                                            .themeMode
                                            .name ==
                                        'dark'
                                    ? Colors.white.withOpacity(0.6)
                                    : Colors.black.withOpacity(0.6)),
                            textAlign: TextAlign.start),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
