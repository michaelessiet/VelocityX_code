import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

var imgurls = [
  "https://media.bizj.us/view/img/11665329/legacy-villageapartment-interior-common-area-4*1024xx8256-4644-0-430.jpg",
  "https://cyreneseattle.com/assets/images/cache/rotator41-126100ef285d6fc2a44634150ea5b7df.jpg",
  "https://seattleluxuryrental.com/wp-content/blogs.dir/18/files/2017/02/72025808_05.jpg",
  "https://luxport.s3.amazonaws.com/9454/96B008B2-B7E4-45BE-915F-21700CF04F63%2B21700CF04F63_001_S.jpg"
];

var beds = {
  "singlebed": Icon(
    Icons.single_bed_rounded,
    color: Vx.green500,
  ),
  "kingbed": Icon(
    Icons.king_bed,
    color: Vx.green500,
  ),
};

List apartments = [
  {
    "tags": "Arty • Vegan • Mental",
    "photo": imgurls[0],
    "pricing": "\$650",
    "contract": "Contract length: 1 year",
    "beds": [beds["kingbed"]],
  },
  {
    "tags": "Detached • Chilled • Arty",
    "photo": imgurls[2],
    "pricing": "\$800",
    "contract": "Contract length: 6 months",
    "beds": [beds["kingbed"], beds["singlebed"], beds["singlebed"]],
  },
  {
    "tags": "Poise • Vegan • Outdoors",
    "photo": imgurls[3],
    "pricing": "\$850",
    "contract": "Contract length: 2 year",
    "beds": [beds["singlebed"], beds["singlebed"]],
  },
  {
    "tags": "Penthouse • Luxurious • Relaxation",
    "photo": imgurls[1],
    "pricing": "\$1200",
    "contract": "Contract length: 1 year",
    "beds": [beds["kingbed"], beds["kingbed"], beds["kingbed"]],
  },
];

class RealEstateLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF1B222E)),
        child: ZStack(
          [
            VStack([
              ZStack(
                [
                  VxBox(
                      child: Image.network(
                    imgurls[1],
                    fit: BoxFit.cover,
                  )).height(MediaQuery.of(context).size.height / 2).make(),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Colors.transparent, Color(0xFF1B222E)],
                            transform: GradientRotation(1.57))),
                    child: VxBox(
                        child: VStack([
                      HStack([
                        "Rura".text.caption(context).semiBold.gray200.make(),
                        10.widthBox,
                        "•".text.caption(context).semiBold.gray200.make(),
                        10.widthBox,
                        "Eco-Friendly"
                            .text
                            .semiBold
                            .caption(context)
                            .gray200
                            .make(),
                        10.widthBox,
                        "•"
                            .text
                            .semiBold
                            .caption(context)
                            .gray200
                            .semiBold
                            .make(),
                        10.widthBox,
                        "Annex".text.semiBold.caption(context).gray200.make(),
                      ]),
                      10.heightBox,
                      VStack([
                        HStack([
                          Icon(
                            Icons.location_on_outlined,
                            color: Vx.white,
                          ),
                          "Southwark, London".text.bold.white.make(),
                        ]),
                        1.heightBox,
                        HStack([
                          beds["kingbed"],
                          beds["singlebed"],
                          5.widthBox,
                          "•"
                              .text
                              .semiBold
                              .caption(context)
                              .gray200
                              .semiBold
                              .make(),
                          5.widthBox,
                          Icon(
                            Icons.single_bed_rounded,
                            color: Vx.white,
                          ),
                        ]),
                        1.heightBox,
                        "Furnished".text.caption(context).gray200.make()
                      ]),
                      15.heightBox,
                      HStack(
                        [
                          HStack(
                            [
                              "\$700".text.bold.xl.white.make(),
                              1.widthBox,
                              "/ month".text.semiBold.gray200.make()
                            ],
                          ),
                          "Bills Included".text.green500.semiBold.make()
                        ],
                        alignment: MainAxisAlignment.spaceBetween,
                      ).wFull(context)
                    ])).alignBottomLeft.p16.make(),
                  )
                ],
                alignment: Alignment.bottomLeft,
              ).hHalf(context),
              VxBox(
                child: VStack(
                  [
                    GestureDetector(
                      onTap: () {},
                      child: VxBox(
                        child: "Send message".text.semiBold.white.make(),
                      )
                          .gradientFromTo(
                              from: Color(0xFF6E52FC), to: Color(0xFF52A0F8))
                          .alignCenter
                          .p16
                          .roundedLg
                          .make(),
                    ).pOnly(bottom: 25),
                    ListView.builder(
                        itemCount: apartments.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, pindex) {
                          return VxBox(
                                  child: ZStack([
                            VxBox(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      apartments[pindex]["photo"],
                                      fit: BoxFit.cover,
                                    ))).height(250).width(150).roundedSM.make(),
                            VxBox()
                                .height(250)
                                .linearGradient([
                                  Colors.transparent,
                                  Color(0xFF1B222E).withOpacity(0.7)
                                ], transform: GradientRotation(1.57))
                                .width(150)
                                .make(),
                            VxBox(
                                    child: VStack([
                              "${apartments[pindex]['tags']}"
                                  .text
                                  .caption(context)
                                  .gray300
                                  .make(),
                              5.heightBox,
                              HStack([
                                "${apartments[pindex]["pricing"]} "
                                    .text
                                    .semiBold
                                    .xl
                                    .white
                                    .make(),
                                1.widthBox,
                                "/month".text.semiBold.gray300.make()
                              ]),
                              5.heightBox,
                              VxBox(
                                child: ListView.builder(
                                  itemCount: apartments[pindex]["beds"].length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return apartments[pindex]["beds"][index];
                                  },
                                ),
                              ).height(20).make(),
                              5.heightBox,
                              apartments[pindex]['contract']
                                  .toString()
                                  .text
                                  .caption(context)
                                  .gray200
                                  .make()
                            ]))
                                .alignBottomLeft
                                .height(250)
                                .width(150)
                                .p12
                                .make()
                          ]).pOnly(right: 15))
                              .height(250)
                              .make();
                        }).expand()
                  ],
                  alignment: MainAxisAlignment.spaceAround,
                ).p16(),
              ).height(MediaQuery.of(context).size.height / 2).make()
            ]).scrollVertical(),
            VxBox(
                    child: VxBox(
              child: HStack(
                [
                  VStack(
                    [
                      Icon(
                        CupertinoIcons.house,
                        color: Color(0xFF52A0F8),
                      ),
                      "Spaces".text.color(Color(0xFF52A0F8)).make()
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  VStack(
                    [
                      Icon(
                        CupertinoIcons.mail,
                        color: Colors.blueGrey[700],
                      ),
                      "Messages".text.color(Colors.blueGrey[800]).make()
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                  VStack(
                    [
                      Icon(
                        Icons.settings,
                        color: Colors.blueGrey[700],
                      ),
                      "Settings".text.color(Colors.blueGrey[800]).make()
                    ],
                    crossAlignment: CrossAxisAlignment.center,
                  ),
                ],
                alignment: MainAxisAlignment.spaceAround,
              ).wFull(context).p16(),
            )
                        .withDecoration(BoxDecoration(
                            color: Colors.blueGrey[900],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))))
                        .make())
                .alignBottomCenter
                .height(150)
                .make()
          ],
          alignment: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
