import 'package:flutter/material.dart';
import 'package:submission_dicoding/extensions.dart';
import 'package:submission_dicoding/models/email.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../../../../constants.dart';

class EmailCard extends StatelessWidget {
  const EmailCard({
    super.key,
    this.isActive = true,
    required this.email,
    required this.press,
  });

  final bool isActive;
  final Email email;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: isActive ? kPrimaryColor : kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(email.image),
                      ),
                      const SizedBox(width: kDefaultPadding / 2),
                      Expanded(
                        child: Text(
                          email.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isActive ? Colors.white : kTextColor,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            email.formattedDate.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                  color: isActive ? Colors.white70 : kGrayColor,
                                ),
                          ),
                          const SizedBox(height: 5),
                          if (email.isAttachmentAvailable)
                            WebsafeSvg.asset(
                              "assets/Icons/Paperclip.svg",
                              colorFilter: ColorFilter.mode(
                                isActive ? Colors.white70 : kGrayColor,
                                BlendMode.srcIn,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email.subject,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isActive ? Colors.white : kTextColor,
                        ),
                  ),
                  const SizedBox(height: kDefaultPadding / 2),
                  Text(
                    email.body,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          height: 1.5,
                          color: isActive ? Colors.white70 : kGrayColor,
                        ),
                  ),
                ],
              ),
            ).addNeumorphism(
              blurRadius: 15,
              borderRadius: 15,
              offset: const Offset(5, 5),
              topShadowColor: Colors.white60,
              bottomShadowColor: const Color(0xFF234395).withOpacity(0.15),
            ),
            if (!email.isChecked)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  height: 12,
                  width: 12,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: kBadgeColor,
                  ),
                ).addNeumorphism(
                  blurRadius: 4,
                  borderRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
