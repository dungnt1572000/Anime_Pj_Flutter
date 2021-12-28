import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

Widget make_flag_language(String flag,String name){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(backgroundImage: AssetImage(flag),radius: 20,),
        Text(name.tr)
      ],
    ),
  );
}

List<Widget> flag_list=[make_flag_language('assets/flag/vietnam_flag.png', 'Viet Nam'),
  make_flag_language('assets/flag/img.png', 'Japan'),
  make_flag_language('assets/flag/eng_flag.png', 'Englist')
];
