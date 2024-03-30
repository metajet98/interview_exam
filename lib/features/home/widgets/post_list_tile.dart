import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interview_exam/models/post_model.dart';
import 'package:intl/intl.dart';

class PostListTile extends StatelessWidget {
  final PostModel postModel;

  const PostListTile({
    super.key,
    required this.postModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.black.withOpacity(0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: AspectRatio(
              aspectRatio: 4,
              child: Image.network(
                fit: BoxFit.cover,
                postModel.imageUrl,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 4),
                Text(
                  postModel.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 4),
                Text(
                  'Author: ${postModel.authorId}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 4),
                Text(
                  'Created at: ${DateFormat('HH:mm yyyy-MM-dd').format(postModel.createdDate)}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildStatistic(
                      icon: const FaIcon(
                        FontAwesomeIcons.shareFromSquare,
                      ),
                      value: postModel.shareCount,
                    ),
                    _buildStatistic(
                      icon: const FaIcon(FontAwesomeIcons.comment),
                      value: postModel.commentCount,
                    ),
                    _buildStatistic(
                      icon: const FaIcon(FontAwesomeIcons.heart),
                      value: postModel.likeCount,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic({
    required Widget icon,
    required int value,
  }) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text('$value'),
      ],
    );
  }
}
