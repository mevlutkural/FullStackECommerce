import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-Ticaret Uygulaması'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kampanyalar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Kampanyalar',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              height: 200.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Örnek 5 kampanya
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    width: 300.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey[300],
                      image: DecorationImage(
                        image: AssetImage('assets/banner_$index.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Çok Satılanlar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Çok Satılanlar',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SizedBox(
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Örnek 10 ürün
                itemBuilder: (context, index) {
                  return Container(
                    width: 120.0,
                    margin: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: Colors.grey[300],
                              image: DecorationImage(
                                image: AssetImage('assets/product_$index.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Ürün $index',
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Popüler Kategoriler
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Text(
                'Popüler Kategoriler',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 12.0),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 3 / 2,
              ),
              itemCount: 6, // Örnek 6 kategori
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.grey[300],
                    image: DecorationImage(
                      image: AssetImage('assets/category_$index.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Kategori $index',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
