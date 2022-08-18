import 'dart:convert';

class Number {
  final String text;
  final int number;
  
  Number({
    required this.text,
    required this.number,
  });

  Number copyWith({
    String? text,
    int? number,
  }) {
    return Number(
      text: text ?? this.text,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'number': number,
    };
  }

  factory Number.fromMap(Map<String, dynamic> map) {
    return Number(
      text: map['text'] ?? '',
      number: map['number']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Number.fromJson(String source) => Number.fromMap(json.decode(source));

  @override
  String toString() => 'Number(text: $text, number: $number)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Number &&
      other.text == text &&
      other.number == number;
  }

  @override
  int get hashCode => text.hashCode ^ number.hashCode;
}
