
import 'package:first_project/modules/login_screen/login_screen.dart';
import 'package:first_project/shared/component/component.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,

      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
           width: double.infinity,

           child: CircleAvatar(
             radius: 73.0,
             child: CircleAvatar(
               backgroundImage:NetworkImage('https://news.uchicago.edu/sites/default/files/styles/full_width/public/images/2019-07/Mobile%20voting.jpg?itok=oezMDWp-',
               ),
               radius: 70.0,

    ),
           ),
         ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(30),topEnd: Radius.circular(30)),
                color: Colors.blueGrey,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text('welcome to voting app',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 20.0),
                    child: Text('let\'s go to sign in ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: 150,
                        height: 50,
                        child: MaterialButton(onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                          navigateTo(context, LoginScreen());

                        },
                          color: Colors.deepOrangeAccent,
                          height: 40,
                          child: Row(
                            children: [
                              Text('Get Started'),
                              Spacer(),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),

                        ),
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),

                ],
              ),
            ),
          )

        ],
      )
    );
  }
}
