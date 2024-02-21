import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  List categoryItemList = [];
 // File? _imageFile;
  String? radioVal = "";
  bool _switchVal = false;
  var dropDownValue;
  var _value;


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      body: getEditProfile(),
    );
  }

  Widget getEditProfile() =>  Form(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage("assets/images/light-2.png"),
                ),
                Positioned(
                  bottom: 1,
                  left: 85,
                  child: IconButton(
                    icon: const Icon(Icons.add_a_photo_outlined, color: Colors.deepPurpleAccent),
                    onPressed: () => {}, //_pickImageFromGallery(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter your age",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: "Enter phone number",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text("Gender"),
                const SizedBox(width: 20),
                Radio(value: "Female", groupValue: _value, onChanged: (value){ setState(() {
                  _value = value;
                });}),
                const SizedBox(width: 2),
                const Text("Female",),
                Radio(value: "Male", groupValue: _value, onChanged: (value){setState(() {
                  _value = value;
                });}),
                const SizedBox(width: 2),
                const Text("Male",),
                Radio(value: "Others", groupValue: _value, onChanged: (value){setState(() {
                  _value = value;
                });}),
                const SizedBox(width: 2),
                const Text("Others",),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Standard  :",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                DropdownButton(
                  hint: const Text('Choose standard'),
                  itemHeight: 60.0,
                  items: categoryItemList.map((item) {
                    return DropdownMenuItem(
                      value: item['ClassCode'],
                      alignment: Alignment.centerLeft,
                      child: Text(item['ClassName'].toString()),
                    );
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      dropDownValue = newVal;
                      print("selected dropDown value $dropDownValue");
                    });
                  },
                  value: dropDownValue,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Join school",
                  style:
                  TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Switch(
                    value: _switchVal,
                    onChanged: (value) {
                      setState(() {
                        _switchVal = value;
                        print("Selected switch value.....$_switchVal");
                      });
                    })
              ],
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      nameController.clear();
                      ageController.clear();
                      phoneController.clear();
                      _switchVal = false;
                      dropDownValue = null;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(105, 114, 248, 1.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.clear,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Reset",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    var name = nameController.text.toString();
                    var age = ageController.text.toString();
                    String number = phoneController.text;
                    var gender = _value;
                    var dropDownVal = dropDownValue;
                    bool switchVal = _switchVal;

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    const Color.fromRGBO(105, 114, 248, 1.0),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "Confirm",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );

  // Future<void> _pickImageFromCamera() async {
  //   final pickFile = await ImagePicker().pickImage(source: ImageSource.camera);
  //   if(pickFile != null){
  //     setState(() {
  //       this._imageFile = File(pickFile.path);
  //     });
  //   }
  // }
  //
  // Future<void> _pickImageFromGallery() async{
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(pickedFile != null){
  //     setState(() {
  //       this._imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
}
