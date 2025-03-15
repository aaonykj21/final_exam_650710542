import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String nickname;
  final String date;
  final String email;
  final String phone;
  final String image;

  const ProfileCard({
    super.key, required this.name, required this.nickname, required this.date, required this.email, required this.phone, required this.image
    // required this.name,
    // required this.nickname,
    // required this.date,
    // required this.email,
    // required this.phone,
    // required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 252, 214, 226),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(image),
          ),
          SizedBox(height: 10),
          Text(nickname),
          SizedBox(height: 10),
          Text(name),
          SizedBox(height: 10),
          Text(date),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 16, color: Colors.blue),
              SizedBox(width: 5),
              Text(email, style: TextStyle(fontSize: 14)),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 16, color: Colors.green),
              SizedBox(width: 5),
              Text(phone, style: TextStyle(fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
