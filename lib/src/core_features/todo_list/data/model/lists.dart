import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Lists extends Equatable {
  const Lists({
    required this.content,
    required this.title,
    required this.date,
    this.id,
  });

  final String content;
  final String? id;
  final String title;
  final Timestamp date;

  factory Lists.fromJson(Map<String, dynamic> json){
    return Lists(
        content: json['content'],
        title: json['title'],
        date: json['date'],
        id: json['id'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [content, title, date];
}