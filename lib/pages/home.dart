import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/pages/category_news.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;
  @override
  void initState() {
    categories = getCategories();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(238, 250, 250, 250),
      body: Container(
        margin: EdgeInsets.only(top: 25, left: 15),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Newz',
                  style: GoogleFonts.timmana(
                    color: const Color.fromARGB(255, 109, 104, 104),
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Sphere',
                  style: GoogleFonts.timmana(
                    color: const Color.fromARGB(255, 42, 205, 255),
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            Text(
              'Hot News',
              style: GoogleFonts.robotoCondensed(
                color: const Color.fromARGB(255, 63, 166, 198),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.65,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  print(articles[index].url);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  (ArticleView(blogUrl: articles[index].url!)),
                        ),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.87,
                      margin: EdgeInsets.only(bottom: 6, right: 8),
                      child: Material(
                        elevation: 3.0,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image.network(
                                    articles[index].urlToImage!,
                                    width:
                                        MediaQuery.of(context).size.width /
                                        1.95,
                                    fit: BoxFit.cover,
                                    height: 105,
                                  ),
                                ),
                              ),
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.915,
                                child: Text(
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  articles[index].title!,
                                  style: GoogleFonts.openSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                padding: EdgeInsets.only(left: 4, right: 3),
                                width: MediaQuery.of(context).size.width / 1.95,
                                child: Text(
                                  maxLines: 2,
                                  articles[index].desc!,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w100,
                                  ),
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 74,
                                height: 26,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 120),
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 26,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Explore',
              style: GoogleFonts.robotoCondensed(
                color: const Color.fromARGB(255, 63, 166, 198),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Container(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryTile(
                    categoryname: categories[index].categoryName,
                    image: categories[index].image,
                  );
                },
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Trending News',
              style: GoogleFonts.robotoCondensed(
                color: const Color.fromARGB(255, 63, 166, 198),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4), 
            Container(
              height: MediaQuery.of(context).size.height / 2.65,
              child: ListView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  print(articles[index].url);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  (ArticleView(blogUrl: articles[index].url!)),
                        ),
                      );
                    },
                    child:Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'images/first.jpg',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.75,
                        child: Text(
                          textAlign: TextAlign.center,
                          'This is my first News App! Do you know?',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.only(left: 4, right: 3),
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Text(
                          'This will be the subtext of the news',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  );
                },
              ),
            ),
            
            Container(
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.asset(
                      'images/first.jpg',
                      height: 90,
                      width: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.75,
                        child: Text(
                          textAlign: TextAlign.center,
                          'This is my first News App! Do you know?',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding: EdgeInsets.only(left: 4, right: 3),
                        width: MediaQuery.of(context).size.width / 1.6,
                        child: Text(
                          'This will be the subtext of the news',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final image, categoryname;
  const CategoryTile({this.image, this.categoryname, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(name: categoryname),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 18),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              // ignore: deprecated_member_use
              child: Image(
                image: AssetImage(image),
                height: 140,
                width: 140,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                color: const Color.fromARGB(57, 0, 0, 0),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              height: 150,
              width: 140,
              child: Center(
                child: Text(
                  categoryname,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
