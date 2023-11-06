import 'package:flutter/material.dart';

import 'model.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationModel> list = [
    NotificationModel(
        image:
            "https://img.freepik.com/free-photo/chat-message-comment-social-media-communication-sign-symbol-icon-3d-rendering_56104-1920.jpg?w=740&t=st=1694287118~exp=1694287718~hmac=6cb57d39d433dfc00ca259b062468ce5d6b8e2d0fa6c5b4dff29bfbd85d0e8bd",
        time: "منذ ساعتان",
        title: "تم قبول طلبك وجاري تحضيره الأن",
        body:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى"),
    NotificationModel(
        image:
            "https://img.freepik.com/free-photo/chat-message-comment-social-media-communication-sign-symbol-icon-3d-rendering_56104-1920.jpg?w=740&t=st=1694287118~exp=1694287718~hmac=6cb57d39d433dfc00ca259b062468ce5d6b8e2d0fa6c5b4dff29bfbd85d0e8bd",
        time: "منذ ساعتان",
        title: "تم قبول طلبك وجاري تحضيره الأن",
        body:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى"),
    NotificationModel(
        image:
            "https://img.freepik.com/premium-photo/3d-rendering-realistic-blue-colour-envelope-icon-symbolic-floating-air_438266-491.jpg?w=740",
        time: "منذ ساعه",
        title: "تم قبول طلبك وجاري تحضيره الأن",
        body:
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("الاستشعارات"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) => _Item(model: list[index]),
          )),
    );
  }
}

class _Item extends StatelessWidget {
  final NotificationModel model;

  const _Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0xff000000).withOpacity(.01),
        //       blurRadius: 10,
        //       offset: Offset(0, 5)
        //
        //   )
        // ]
      ),
      margin: EdgeInsetsDirectional.only(end: 10, start: 10, bottom: 6, top: 6),
      height: 80,
      child: Row(
        children: [
          Container(
            height: 33,
            width: 33,
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Theme.of(context).primaryColor.withOpacity(.12),
            ),
            child: Image.network(model.image,
                height: 20, width: 20, fit: BoxFit.scaleDown),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  model.body,
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff989898)),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  model.time,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
