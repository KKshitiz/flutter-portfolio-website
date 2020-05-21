import 'package:flutter/cupertino.dart';
import 'package:flutterportfoliowebsite/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutterportfoliowebsite/services/launch_url.dart';
import 'package:flutterportfoliowebsite/widgets/avatar_widget.dart';

class SideBar extends StatelessWidget {
  SideBar(this.currentScreen);
  final int currentScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.black),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Avatar(
            radius: 50,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            kAvatarName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialIcon(
                icon: FontAwesomeIcons.facebookF,
                url: kFacebookUrl,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.github,
                url: kGithubUrl,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.instagram,
                url: kInstagramUrl,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.twitter,
                url: kTwitterUrl,
              ),
              SocialIcon(
                icon: FontAwesomeIcons.linkedinIn,
                url: kLinkedInUrl,
              )
            ],
          ),
          NavigationPane(currentScreen),
          Text(
            '© Copyright $kAvatarName',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            'Designed by KKshitiz',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class NavigationPane extends StatelessWidget {
  NavigationPane(this.currentScreen);
  final int currentScreen;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NavigationTile(
            icon: Icons.home,
            label: 'Home',
            isActive: 1 == currentScreen,
          ),
          NavigationTile(
            icon: Icons.person_outline,
            label: 'About',
            isActive: 2 == currentScreen,
          ),
          NavigationTile(
            icon: Icons.settings,
            label: 'Projects',
            isActive: 3 == currentScreen,
            onPress: () {
              launchUrlBrowser('github.com');
            },
          ),
          NavigationTile(
            icon: Icons.book,
            label: 'Education',
            isActive: 4 == currentScreen,
          ),
          NavigationTile(
            icon: Icons.videogame_asset,
            label: 'Hobbies',
            isActive: 5 == currentScreen,
          ),
          NavigationTile(
            icon: Icons.library_books,
            label: 'Resume',
            isActive: 6 == currentScreen,
          ),
          NavigationTile(
            icon: Icons.email,
            label: 'Contact',
            isActive: 7 == currentScreen,
          ),
        ],
      ),
    );
  }
}

class NavigationTile extends StatelessWidget {
  NavigationTile({this.icon, this.label, this.isActive, this.onPress});
  final IconData icon;
  final String label;
  final bool isActive;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? Colors.blue : Colors.grey,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(
                label,
                style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey,
                    fontSize: 15,
                    letterSpacing: 1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  SocialIcon({@required this.icon, this.url});
  final IconData icon;
  final url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: () {
          launchUrlBrowser(url);
        },
        shape: CircleBorder(),
        padding: EdgeInsets.all(0),
        fillColor: Color(0xff312421),
        hoverColor: Colors.blue,
        child: Icon(
          icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
