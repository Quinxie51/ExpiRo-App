class CardData {
  String foodName;
  String expiryDate;
  String category;
  String imageUrl;
  String reminderRate;

  CardData({
    required this.foodName,
    required this.expiryDate,
    required this.category,
    required this.imageUrl,
    required this.reminderRate,
  });

  Map<String, dynamic> toJson() => {
    'foodName': foodName,
    'expiryDate': formatExpiryDate(expiryDate),
    // 'expiryDate': DateFormat('MM-dd-yyyy').format(DateTime.parse(expiryDate)), this is causing an errorh
    'category': category,
    'imageUrl': imageUrl,
    'reminderRate': reminderRate,
  };

  String formatExpiryDate(date) {
    print("this is the date: " + date);
    // if (date.substring(2,3) == "-") {
    //   print(date + "   xxxxxxxxhere");
    //   return date;
    // }
    // String newExpiryDate = "${date.substring(5, 7)}-${date.substring(8, 10)}-${date.substring(0, 4)}";
    // print(newExpiryDate + "   xxxxxxxxthere");

    // return newExpiryDate;
    return date;
  }

  factory CardData.fromJson(Map<String, dynamic> json) => CardData(
    foodName: json['foodName'] as String,
    expiryDate: json['expiryDate'] as String,
    category: json['category'] as String,
    imageUrl: json['imageUrl'] as String,
    reminderRate: json['reminderRate'] as String,
  );
}
