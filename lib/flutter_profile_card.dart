import 'package:flutter/material.dart';
import 'package:flutter_profile_card/models/Profile.dart';
import 'package:flutter_profile_card/widgets/Stat.dart';

class ProfileCard extends StatefulWidget {
  final ProfileModel profile;
  final Function(ProfileModel) onFollowed;

  final String aboutLabel;
  final String followLabel;
  final String unfollowLabel;
  final String followersLabel;
  final String followingsLabel;

  const ProfileCard({
    Key key,
    @required this.profile,
    this.onFollowed,
    this.aboutLabel = 'About',
    this.followLabel = 'Follow',
    this.unfollowLabel = 'Unfollow',
    this.followersLabel = 'Followers',
    this.followingsLabel = 'Followings',
  }) : super(key: key);

  @override
  _ProfileCardState createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    print(widget.profile.isFollow);
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          color: Theme.of(context).primaryColor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.grey[700],
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Theme.of(context).primaryColor,
                    backgroundImage: NetworkImage(widget.profile.avatarURL),
                  ),
                ),
              ),
              Text(
                widget.profile.username.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: Theme.of(context).textTheme.headline4.fontSize,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatWidget(
                      number: widget.profile.followers.toString(),
                      label: widget.followersLabel,
                    ),
                    StatWidget(
                      number: widget.profile.followings.toString(),
                      label: widget.followingsLabel,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: widget.profile.status.isNotEmpty,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    widget.aboutLabel.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.headline6.fontSize,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                Text(
                  widget.profile.status,
                  style: TextStyle(
                      fontSize: Theme.of(context).textTheme.bodyText2.fontSize),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: widget.onFollowed != null,
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 30.0,
            ),
            child: Center(
              child: RaisedButton(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 100.0,
                ),
                color: !widget.profile.isFollow
                    ? Theme.of(context).primaryColor
                    : Colors.grey,
                onPressed: () async => widget.onFollowed(widget.profile),
                child: Text(
                  !widget.profile.isFollow
                      ? widget.followLabel.toUpperCase()
                      : widget.unfollowLabel.toUpperCase(),
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.headline5.fontSize,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
