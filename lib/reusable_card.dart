import 'package:flutter/material.dart';

import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final IconData leading;
  final Color color;
  final String title;
  final IconData trailing;
  ReusableCard({@required this.leading,@required this.color,@required this.title,@required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: color,
                child: Icon(leading,color: Colors.white,),
              ),
              SizedBox(width: 35.0,),
              Text(title,style: KText,),
            ],
          ),
          
          Icon(trailing,color: Colors.grey,),
        ],
      ),
    );
  }
}