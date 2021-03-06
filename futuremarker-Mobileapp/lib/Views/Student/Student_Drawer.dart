import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:futuremarkerapp/Views/Instructor/Courses.dart';
import 'package:futuremarkerapp/Views/Instructor/Home.dart';
import 'package:futuremarkerapp/Views/Instructor/Profile.dart';
import 'package:futuremarkerapp/Views/Student/SProfile.dart';


class MyDrawer extends StatelessWidget {
  @override
  final Color active = Colors.white;
  final Color divider = Colors.grey.shade600;
  final Color primary = Color(0xfff263238);
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalRightBorderClipper(),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 40),
          decoration: BoxDecoration(
              color: primary, boxShadow: [BoxShadow(color: Colors.black45)]),
          width: 300,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),

                  Container(
                    height: 90,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.orange, Colors.deepOrange])),
                    child: CircleAvatar(
                      radius: 40,
                      //   backgroundImage: CachedNetworkImageProvider(image),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    "Mohamed Essam",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "essam.lfc@gmail.com",
                    style: TextStyle(color: active, fontSize: 16.0),
                  ),
                  SizedBox(height: 30.0),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => InstructorHome()),
                      );
                    },
                      child: _buildRow(Icons.home, "Home")),
                  buildDivider(),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StudentProfile()),
                        );
                      },
                      child: _buildRow(Icons.person_pin, "My profile")),
                  buildDivider(),
                  InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyCourses()),
                        );
                      },
                      child: _buildRow(Icons.folder_shared, "Courses")),
                  buildDivider(),
                  _buildRow(Icons.grade, "Grades"),
                  buildDivider(),
                  _buildRow(Icons.message, "Messages", showBadge: true),
                  buildDivider(),
                  _buildRow(Icons.notifications, "Notifications",
                      showBadge: true),
                  buildDivider(),
                  _buildRow(Icons.settings, "Settings"),
                  buildDivider(),
                  SizedBox(height: 50.0,),
                  _buildRow(Icons.power_settings_new, "Log Out"),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Divider buildDivider() {
    return Divider(
      color: divider,
    );
  }

  Widget _buildRow(IconData icon, String title, {bool showBadge = false}) {
    final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(children: [
        Icon(
          icon,
          color: active,
        ),
        SizedBox(width: 10.0),
        Text(
          title,
          style: tStyle,
        ),
        Spacer(),
        showBadge ? Material(
          color: Colors.deepOrange,
          elevation: 5.0,
          shadowColor: Colors.red,
          borderRadius: BorderRadius.circular(5.0),
          child: Container(
            width: 25,
            height: 25,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Text(
              "10+",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ):Container(),
      ]),
    );
  }
}