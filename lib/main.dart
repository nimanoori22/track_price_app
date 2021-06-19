import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home()
  ));
}


class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String imgLink = 'https://dkstatics-public.digikala.com/digikala-products/79f4b1e3c31fb22fa193ea1393e2cb8e8a5863cc_1605085571.jpg?x-oss-process=image/resize,m_lfit,h_600,w_600/quality,q_80';

  List<String> features = ['ظرفیت حافظه RAM: 8 گیگابایت', 'ظرفیت حافظه داخلی: 256 گیگابایت', 'سازنده پردازنده گرافیکی: Apple', 'اندازه صفحه نمایش: 13.3 اینچ', 'طبقه\u200cبندی: کاربری عمومی، باریک و سبک', 'سری پردازنده: M1', 'نوع حافظه RAM: Unified', 'دقت صفحه نمایش: QHD|2560x1600', 'صفحه نمایش مات: خیر', 'صفحه نمایش لمسی: خیر', 'سیستم عامل: Apple Mac OS', 'پورت HDMI: ندارد', 'مشاهده بیشتر'];

  List<int> nums = [1, 2];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SingleChildScrollView(
          // padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/laptop.jpg'),
              const SizedBox(height: 5.0,),
              const Text(
                'لپ تاپ 13 اینچی اپل مدل MacBook Air MGN63 2020',
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.bold,
                ),
                ),
                const SizedBox(height: 10.0,),
                Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            print('hi');
                          }, 
                          child: const Text('خرید'),
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(239, 57, 78, 1)
                          ),
                          ),
                        const Text(
                          '۲۶,۵۹۵,۰۰۰ تومان',
                          style: TextStyle(
                            color: Colors.red, 
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                  ),
                    ),
                    color: Colors.white,
                ),
              ListView.builder(scrollDirection: Axis.vertical, shrinkWrap: true, itemCount: features.length, itemBuilder: (BuildContext context, index){
                return Card(
                  child: Text(features[index]),
                );
              }),
            ]
          ),
          ),
    ),
    );
  }
}

