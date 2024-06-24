
import 'package:flutter/material.dart';
import 'package:flutter_page_view_indicator/flutter_page_view_indicator.dart';
import 'package:stylish_ecommerce_app/src/screens/home_screen/widgets/sale_announcement_item_widget.dart';

class SaleAnnouncementBarWidget extends StatefulWidget {
  const SaleAnnouncementBarWidget({super.key, required this.saleAnnounces});
  final List<String> saleAnnounces;

  @override
  State<SaleAnnouncementBarWidget> createState() => _SaleAnnouncementBarWidgetState();
}

class _SaleAnnouncementBarWidgetState extends State<SaleAnnouncementBarWidget> {
    int _saleAnnounceViewIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
                  height: 190,
                  child: PageView.builder(
                      onPageChanged: (index) {
                        setState(() {
                          _saleAnnounceViewIndex = index % widget.saleAnnounces.length;
                        });
                      },
                      //itemCount: saleAnnounces.length,
                      itemBuilder: (context, index) {
                        return SaleAnnouncementWidget(sale: widget.saleAnnounces[index % widget.saleAnnounces.length]);
                      }),
                ),
        const SizedBox(
              height: 10,
            ),
            PageViewIndicator(
                currentSize: 10,
                currentColor: Theme.of(context).primaryColor,
                length: widget.saleAnnounces.length,
                currentIndex: _saleAnnounceViewIndex),
      ],
    );
  }
}
