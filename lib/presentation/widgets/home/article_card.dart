import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_news/data/models/news.dart';
// import 'package:world_news/data/services/news_service.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArticleCard extends StatefulWidget {
  final News item;
  final int index;
  final ValueNotifier<List<bool>> clickedItems;

  const ArticleCard({
    super.key,
    required this.item,
    required this.index,
    required this.clickedItems,
  });

  @override
  _ArticleCardState createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<bool>>(
      valueListenable: widget.clickedItems,
      builder: (context, clickedItemsValue, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: GestureDetector(
            onTap: () {
              widget.clickedItems.value[widget.index] = true;
              Future.delayed(const Duration(milliseconds: 300), () {
                if (!mounted) return;
                widget.clickedItems.value[widget.index] = false;
                // ignore: invalid_use_of_protected_member
                widget.clickedItems.notifyListeners();
                // Action de navigation
                context.push('/details', extra: widget.item);
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                color: clickedItemsValue[widget.index]
                    ? Colors.grey[200]
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 180,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.item.category,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.item.title,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Colors.grey, size: 15),
                                SizedBox(width: 3),
                                Text(
                                  "1h ago",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(FontAwesomeIcons.comment,
                                    color: Colors.grey, size: 12),
                                SizedBox(width: 3),
                                Text(
                                  "5",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 90,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        widget.item.imageUrl,
                        fit: BoxFit.cover,
                        height: 80,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset("assets/imgs/buildding.jpg",
                              fit: BoxFit.cover, height: 80);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
