import 'package:finalabanob/features/search/data/search/datum.dart';
import 'package:flutter/material.dart';

class BuildListProductsToSearch extends StatelessWidget {
  const BuildListProductsToSearch({
    super.key,
    required this.search,
  });
  final Datum search;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: 120.0,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image(
                  image: NetworkImage('${search.cover}'),
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            const SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${search.description}',
                    maxLines: 2,
                    style: const TextStyle(fontSize: 14.0, height: 1.3),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${search.price} \$',
                        style: const TextStyle(
                            fontSize: 12.0, color: Colors.amber),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                          },
                          icon:const CircleAvatar(
                            radius: 15.0,
                            backgroundColor: Colors.grey,
                            child:  Icon(
                              Icons.favorite_border,
                              size: 16.0,
                              color: Colors.white,
                            ),
                          ))
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
