import 'package:flutter/material.dart';
import '../../constants.dart';
import 'components/header.dart';
import 'package:submission_dicoding/models/email.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({
    super.key,
    required this.email,
  });

  final Email email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                const Divider(thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 24,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(email.image),
                      ),
                      const SizedBox(width: kDefaultPadding),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text.rich(
                                        TextSpan(
                                          text: email.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                          children: [
                                            TextSpan(
                                              text: " to Unknown",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        email.subject,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: kDefaultPadding / 2),
                                Text(
                                  email.formattedDate,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const SizedBox(height: kDefaultPadding),
                            Text(
                              email.body,
                              style: const TextStyle(
                                height: 1.5,
                                color: Color(0xFF4D5875),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: kDefaultPadding),
                            if (email.isAttachmentAvailable)
                              const Row(
                                children: [
                                  Text(
                                    "1 attachment", // Dummy number
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            const Divider(thickness: 1),
                            const SizedBox(height: kDefaultPadding / 2),
                            if (email.isAttachmentAvailable)
                              GridView.builder(
                                physics:
                                    const NeverScrollableScrollPhysics(), 
                                shrinkWrap:
                                    true, 
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, 
                                  childAspectRatio:
                                      1.5, 
                                  mainAxisSpacing: kDefaultPadding,
                                  crossAxisSpacing: kDefaultPadding,
                                ),
                                itemCount: 3, 
                                itemBuilder: (context, index) => ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    "assets/images/Img_$index.png", // Example image
                                    fit: BoxFit.cover, 
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
