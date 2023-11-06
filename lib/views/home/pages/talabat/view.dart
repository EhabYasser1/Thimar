import 'package:flutter/material.dart';

class TalabatyPage extends StatefulWidget {
  const TalabatyPage({super.key});

  @override
  State<TalabatyPage> createState() => _TalabatyPageState();
}

class _TalabatyPageState extends State<TalabatyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("طلباتي"),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طلب #4587",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/healthy-orange-carrots-graphic-illustration_53876-8469.jpg?w=740&t=st=1694293078~exp=1694293678~hmac=4ac08a6bb9441c5747b942cce6e64ae2ee9a6e322452c5b075a7d201f3118244",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/watermelon-with-green-bottom-red-bottom_341269-1169.jpg?w=740&t=st=1694292869~exp=1694293469~hmac=e8abaac7060c82bd6a679a4ca9151a942d7c201603772caee6569444154182bd",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          Text(
                            "180 ر.س  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طلب #4587",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/healthy-orange-carrots-graphic-illustration_53876-8469.jpg?w=740&t=st=1694293078~exp=1694293678~hmac=4ac08a6bb9441c5747b942cce6e64ae2ee9a6e322452c5b075a7d201f3118244",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/watermelon-with-green-bottom-red-bottom_341269-1169.jpg?w=740&t=st=1694292869~exp=1694293469~hmac=e8abaac7060c82bd6a679a4ca9151a942d7c201603772caee6569444154182bd",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          Text(
                            "180 ر.س  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طلب #4587",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/healthy-orange-carrots-graphic-illustration_53876-8469.jpg?w=740&t=st=1694293078~exp=1694293678~hmac=4ac08a6bb9441c5747b942cce6e64ae2ee9a6e322452c5b075a7d201f3118244",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/watermelon-with-green-bottom-red-bottom_341269-1169.jpg?w=740&t=st=1694292869~exp=1694293469~hmac=e8abaac7060c82bd6a679a4ca9151a942d7c201603772caee6569444154182bd",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          Text(
                            "180 ر.س  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طلب #4587",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/healthy-orange-carrots-graphic-illustration_53876-8469.jpg?w=740&t=st=1694293078~exp=1694293678~hmac=4ac08a6bb9441c5747b942cce6e64ae2ee9a6e322452c5b075a7d201f3118244",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/watermelon-with-green-bottom-red-bottom_341269-1169.jpg?w=740&t=st=1694292869~exp=1694293469~hmac=e8abaac7060c82bd6a679a4ca9151a942d7c201603772caee6569444154182bd",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          Text(
                            "180 ر.س  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "طلب #4587",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "${DateTime.now().year},${DateTime.now().month},${DateTime.now().day}"),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-photo/close-up-photo-tomatoes-white-background-high-quality-photo_114579-35370.jpg?w=740&t=st=1694291942~exp=1694292542~hmac=a38100bd7294c36c06213459e740a44d136bd589e06445da6ecb7275a0996e1a",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/healthy-orange-carrots-graphic-illustration_53876-8469.jpg?w=740&t=st=1694293078~exp=1694293678~hmac=4ac08a6bb9441c5747b942cce6e64ae2ee9a6e322452c5b075a7d201f3118244",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/watermelon-with-green-bottom-red-bottom_341269-1169.jpg?w=740&t=st=1694292869~exp=1694293469~hmac=e8abaac7060c82bd6a679a4ca9151a942d7c201603772caee6569444154182bd",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.12),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Text(
                                    "+2",
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).primaryColor),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 11, vertical: 5),
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.12),
                              borderRadius: BorderRadius.circular(7),
                            ),
                            child: Center(
                              child: Text(
                                "بإنتظار الموافقة",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          Text(
                            "180 ر.س  ",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w900,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
