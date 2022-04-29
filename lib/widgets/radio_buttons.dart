import 'package:flutter/material.dart';

class  RadioButtons extends StatefulWidget {
  const  RadioButtons({ Key? key }) : super(key: key);

  @override
  State< RadioButtons> createState() => _RadioButtonsState();
}

class _RadioButtonsState extends State< RadioButtons> {
  String _selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          
            children: [
             
              ListTile(
                leading: Radio<String>(
                  value: 'male',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Male'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'female',
                  groupValue: _selectedGender,
                  onChanged: (value) {
                    setState(() {
                      _selectedGender = value!;
                    });
                  },
                ),
                title: const Text('Female'),
              ),
            ])

    
    );
  }
}