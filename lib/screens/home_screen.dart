import 'package:flutter/material.dart';
import '../widgets/NewsListView.dart';
import '../widgets/categories_list_view.dart';
import '../widgets/news_list_view_builder.dart';
import '../widgets/news_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
      //  backgroundColor:  Colors.red,
        title: Center(
            child: RichText(
              text: TextSpan(
                  children: [
                    TextSpan(
                        text: "News",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextSpan(
                        text: "Cloud",
                        style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        )

                    ),

                  ]
              ),


            )),

      ),

      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child:  CategoriesListView(),

            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 30,),

            ),
            NewsListViewBuilder(category: "general",),
          ],
        ),
        ),
      );






  }
}


