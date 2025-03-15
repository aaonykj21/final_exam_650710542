import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String email;
  final String image;

  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(16),
      // width: 300,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          CircleAvatar(radius: 40, backgroundImage: NetworkImage(image)),
          SizedBox(height: 10),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ชื่อผู้ใช้: ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'อีเมล: ',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              Text(email, style: TextStyle(fontSize: 14, color: Colors.grey)),
              SizedBox(height: 10),
            ],
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.blue),
            title: Text('การตั้งค่า'),
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.blue),
            title: Text('เปลี่ยนรหัสผ่าน'),
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip, color: Colors.blue),
            title: Text('ความเป็นส่วนตัว'),
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("แก้ไขโปรไฟล์")));
            },
            child: const Text('แก้ไขโปรไฟล์'),
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("ออกจากระบบ")));
            },
            child: const Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('โปรไฟล์ผู้ใช้'), backgroundColor: Colors.blue,),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProfileCard(
          name: 'Natcha Yakermjit', 
          email: 'yakermjit_n@silpakorn.edu',
          image: 'https://www.kasandbox.org/programming-images/avatars/leaf-blue.png'
          )
          ],
        )
      )
    );
  }
}
