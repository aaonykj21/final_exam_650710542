import 'package:flutter/material.dart';

class FormExam extends StatefulWidget {
  const FormExam({super.key});

  @override
  State<FormExam> createState() => _FormExamState();
}

class _FormExamState extends State<FormExam> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _weight;
  String? _selectedItem;
  String? _fast;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('คำนวณค่าจัดส่ง')),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'น้ำหนักสินค้า (กก.):',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดกรอกน้ำหนักสินค้า';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                  });
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'เลือกระยะทาง'),
                value: _selectedItem,
                items:
                    ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedItem = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text('บริการเสริม:')
              ],),
              SizedBox(height: 10,),
              Column(children: [
                CheckboxListTile(
                title: const Text('แพ็คกิ้งพิเศษ (+20 บาท)'),
                value: _isChecked1,
                onChanged: (value) {
                  setState(() {
                    _isChecked1 = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('ประกันพัสดุ (+50 บาท)'),
                value: _isChecked2,
                onChanged: (value) {
                  setState(() {
                    _isChecked2 = value!;
                  });
                },
              ),
              ],),
              
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                Text('เลือกความเร่งด่วน:')
              ],),
              SizedBox(height: 10,),
              Column(
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        value: 'ปกติ',
                        groupValue: _fast,
                        onChanged: (value) {
                          setState(() {
                            _fast = value; 
                          });
                        },
                      ),
                      Text('ปกติ'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'ด่วน',
                        groupValue: _fast,
                        onChanged: (value) {
                          setState(() {
                            _fast = value; 
                          });
                        },
                      ),
                      Text('ด่วน'),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'ด่วนพิเศษ',
                        groupValue: _fast,
                        onChanged: (value) {
                          setState(() {
                            _fast = value; 
                          });
                        },
                      ),
                      Text('ด่วนพิเศษ'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
               ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    print(_weight);
                    print(_fast);
                    print(_selectedItem);
                  }
                },
                child: const Text('คำนวณราคา'),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                width: 450,
                color: Colors.blue,
                child: Text('คำนวณค่าจัดส่งทั้งหมด: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
