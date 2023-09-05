import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_page.dart';

Widget mainDrawer(BuildContext context) => Drawer(
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("hee462"),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundImage: AssetImage("images/pro.png"),
              )
            ],
            accountName: Text("hee462"),
            accountEmail: Text("hee462@hee462.com"),
          ),
          ListTile(
            title: const Text("Home",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading: const Icon(Icons.home, color: Colors.blue),
            onTap: () {
              debugPrint("Home 메뉴 클릭");

              /// 스마트 기기에서 현재 화면을 다른 화면으로 전환하기
              /// web,pc 어플리케이션에서는 단순히 화면을 전환하는데 별어려움없이 수행가능
              /// 하지만 스마트 기기에서는 화면하나하나가 context(메모리) 이다
              /// 화면을 전환시킬때도 context라는 친구를 잘 관리해야한다
              // const HomePage();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const HomePage(),
              ));
            },
          ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
              title: const Text("MyPage",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  )),
              leading: const Icon(Icons.supervised_user_circle_outlined,
                  color: Colors.blue),

              /// 어플에서 화면전환 필요할때
              onTap: () => Navigator.of(context).pushNamed("/mypage")

              /// 한 화면내에서 사용할대는 아래방법
              // onTap: () {
              //   debugPrint("mypage 클릭");
              //   Navigator.of(context).push(
              //     MaterialPageRoute(
              //       builder: (context) => const MyPage(),
              //     ),
              //   );
              // },
              ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
          ListTile(
            title: const Text("email",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                )),
            leading: const Icon(Icons.email_outlined, color: Colors.blue),
            onTap: () => Navigator.of(context).pushNamed(
              "/email",
              arguments: {"email": "hee462@hee462.com", "password": "12345"},
            ),
            // onTap: () {
            //   debugPrint("email 클릭");
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const EmailPage(),
            //   ));
            // },
          ),
          const Divider(
            height: 0.5,
            color: Colors.blue,
          ),
        ],
      ),
    );
