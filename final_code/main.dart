import 'package:flutter/material.dart';
import 'package:inshorts/article.dart';
import 'package:inshorts/dio_client.dart';

void main() {
  runApp(const InshortsClone());
}

class InshortsClone extends StatelessWidget {
  const InshortsClone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Workshop",
      home: Home(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> title = [
    'Twitter tests long-form text feature called ‘Notes’',
    'BMW starts new production',
    'Tesla\'s new car factories losing billions of dollars',
    'Cincinnati and Northern Kentucky property sales',
  ];

  final List<String> images = [
    "https://akm-img-a-in.tosshub.com/businesstoday/images/story/202206/twitter_1200_250421082510-sixteen_nine_0-sixteen_nine.jpg",
    "https://responsive.fxempire.com/width/600/webp-lossy-70.q50/_fxempire_/2022/06/tagreuters.com2022newsml_LYNXMPEI5M01R1.jpg",
    "https://img.etimg.com/thumb/msid-92399942,width-1070,height-580,imgsize-42428,overlay-ettech/photo.jpg",
    "https://i.dailymail.co.uk/1s/2022/06/23/02/59412339-0-image-a-9_1655946015640.jpg"
  ];

  final List<String> description = [
    "The long-form feature is being tested by a small group of writers and Twitter did not give more details on its wider roll-out.Twitter Inc said on Wednesday it was testing a new feature called \"Notes\" that would allow users to share essay-like write-ups as a link both on and off the social media platform.",
    "SHANGHAI (Reuters) – Germany’s BMW said on Thursday that production has formally begun at a new plant in China with an investment of 15 billion yuan (\$2.24 billion) as the carmaker accelerates electric vehicle (EV) production.",
    "Elon Musk said Tesla's Texas factory produces a \"tiny\" number of cars because of challenges in boosting production of its new \"4680\" batteries and as tools to make its conventional 2170 batteries are \"stuck in port in China.\"",
    "Each week we compile local real estate records so you can find out what property is selling for in your neighborhood.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
              child: Text("Inshorts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ))),
        ),
        body: FutureBuilder<List<NewsArticle>?>(
            future: DioClient().getArticles(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var articles = snapshot.data!;
                return PageView.builder(
                    itemCount: title.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      var a = articles[index];
                      return Column(
                        children: [
                          Container(
                            height: 250,
                            width: MediaQuery.of(context).size.width,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: Image.network(a.imageUrl)),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Text(
                                  a.title,
                                  style: const TextStyle(fontSize: 22),
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Container(
                              child: Text(
                                a.content,
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                            ),
                          )
                        ],
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }));
  }
}
