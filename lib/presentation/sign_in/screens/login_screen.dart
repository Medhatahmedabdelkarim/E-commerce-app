
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/login_form.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:Padding(padding:
        EdgeInsets.only(
          top: 12,
          left: 12,
          bottom: 12,
          right: 12,
        ),
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    height: 150,
                    width: 200,
                    image: AssetImage("assets/Images/CasaForsa.png"),
                  ),
                ),
                Text('Discover unmatched oppurtunities',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 28),),
                SizedBox(height: 8,),
                Text('Be able to explore the wonders of the world',style: Theme.of(context).textTheme.bodyMedium,)
              ],
            ),
            LoginForm(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(
                    thickness: 0.5,
                    indent: 60,
                    endIndent: 5,
                  ),
                ),
                Text('Or Sign In With',style: Theme.of(context).textTheme.labelMedium,),
                Flexible(
                  child: Divider(
                    thickness: 0.5,
                    indent: 5,
                    endIndent: 60,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:40,
                  height:40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey)


                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(onTap: (){},child:Center(child:Image(image: AssetImage("assets/Images/googleIcon2.png"),fit: BoxFit.cover,)
                      ,)),
                  ),

                ),
                SizedBox(width: 12,),
                Container(
                  width:40,
                  height:40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.grey)

                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(onTap: (){},child:Center(child:Image(image: AssetImage("assets/Images/facebookIcons.png"),fit: BoxFit.cover,)
                      ,)),
                  ),

                ),
              ],
            )
          ],),
        ),
      ),
    );
  }
}
