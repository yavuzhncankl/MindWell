import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindwell/blogePage/bloge_page.dart';
import 'package:mindwell/config/router/get_x.dart';
import 'package:mindwell/gunlukPage/gunnluk_page.dart';
import 'package:mindwell/homepage/homePage.dart';
import 'package:mindwell/profilePage/profile_page.dart';
import 'package:mindwell/profilePage/profile_page2.dart';
import 'package:mindwell/sigaraPage/ogi.dart';

Widget bottomBar(BuildContext context) {
  GenelController controller = Get.find<GenelController>();
  return Obx(
    () => ConvexAppBar(
      items: const [
        TabItem(
          icon: Icons.date_range_outlined,
          title: 'Günlük',
        ),
        TabItem(icon: Icons.do_not_disturb_alt_rounded, title: 'Sigara'),
        TabItem(icon: Icons.hourglass_empty, title: 'Home'),
        TabItem(icon: Icons.mark_unread_chat_alt_outlined, title: 'blog'),
        TabItem(icon: Icons.manage_accounts, title: 'Profil'),
      ],
      initialActiveIndex: controller.selectedPage.value,
      backgroundColor: const Color.fromRGBO(130, 158, 178, 1),
      height: 65,
      onTap: (int i) {
        controller.selectedPage.value = i;
        if (i == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const GunlukPage())));
        } else if (i == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SigaraPage())));
        } else if (i == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const HomePage())));
        } else if (i == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => BlogePage())));
        } else if (i == 4) {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const ProfilePage2())));
        }
      },
    ),
  );
}
