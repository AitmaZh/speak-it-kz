import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

class OrganizationInfoPage extends StatefulWidget {
  dynamic id;

  OrganizationInfoPage({super.key, required this.id});

  @override
  State<OrganizationInfoPage> createState() => _OrganizationInfoPageState();
}

class _OrganizationInfoPageState extends State<OrganizationInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Organization Name'),
              Text('Industry'),
              Divider(color: transparentColor,),
              
            ],
          ),
        ),
      ),
    );
  }
}
