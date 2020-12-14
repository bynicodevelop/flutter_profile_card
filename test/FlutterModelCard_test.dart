import 'package:flutter/material.dart';
import 'package:flutter_profile_card/flutter_profile_card.dart';
import 'package:flutter_profile_card/models/Profile.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

main() {
  testWidgets('Should see basics componants', (WidgetTester tester) async {
    // ARRANGE
    ProfileModel profileModel = ProfileModel(
      uid: '123456789',
      username: 'John Doe',
      status: 'status',
      avatarURL: 'status',
      followers: 2,
      followings: 1,
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: ProfileCard(
            profile: profileModel,
          ),
        ),
      );
    });

    // ACT
    final Finder usernameFinder =
        find.text(profileModel.username.toUpperCase());
    final Finder followersNumberFinder =
        find.text(profileModel.followers.toString());
    final Finder followingNumberFinder =
        find.text(profileModel.followings.toString());
    final Finder followButton = find.text('follow'.toUpperCase());

    // ASSERT
    expect(usernameFinder, findsOneWidget);
    expect(followersNumberFinder, findsOneWidget);
    expect(followingNumberFinder, findsOneWidget);
    expect(followButton, findsNothing);
  });

  testWidgets('Should see follow button', (WidgetTester tester) async {
    // ARRANGE
    ProfileModel profileModel = ProfileModel(
      uid: '123456789',
      username: 'John Doe',
      status: 'status',
      avatarURL: 'status',
      followers: 2,
      followings: 1,
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: ProfileCard(
            profile: profileModel,
            onFollowed: (_) => null,
          ),
        ),
      );
    });

    // ACT
    final Finder followButton = find.text('follow'.toUpperCase());

    // ASSERT
    expect(followButton, findsOneWidget);
  });

  testWidgets('Should see unfollow button', (WidgetTester tester) async {
    // ARRANGE
    ProfileModel profileModel = ProfileModel(
      uid: '123456789',
      username: 'John Doe',
      status: 'status',
      avatarURL: 'status',
      followers: 2,
      followings: 1,
      isFollow: true,
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: ProfileCard(
            profile: profileModel,
            onFollowed: (_) => null,
          ),
        ),
      );
    });

    // ACT
    final Finder followButton = find.text('unfollow'.toUpperCase());

    // ASSERT
    expect(followButton, findsOneWidget);
  });

  testWidgets('Should capture follow button event',
      (WidgetTester tester) async {
    // ARRANGE
    bool event = false;
    ProfileModel profileModel = ProfileModel(
      uid: '123456789',
      username: 'John Doe',
      status: '',
      avatarURL: 'status',
      followers: 2,
      followings: 1,
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: ProfileCard(
            profile: profileModel,
            onFollowed: (_) => event = true,
          ),
        ),
      );
    });

    // ACT
    final Finder followButton = find.text('follow'.toUpperCase());
    await tester.tap(followButton);

    // ASSERT
    expect(event, true);
  });

  testWidgets('Should not see about section', (WidgetTester tester) async {
    // ARRANGE
    ProfileModel profileModel = ProfileModel(
      uid: '123456789',
      username: 'John Doe',
      status: '',
      avatarURL: 'status',
      followers: 2,
      followings: 1,
      isFollow: true,
    );

    await provideMockedNetworkImages(() async {
      await tester.pumpWidget(
        MaterialApp(
          title: 'Flutter Demo',
          home: ProfileCard(
            profile: profileModel,
            onFollowed: (_) => null,
          ),
        ),
      );
    });

    // ACT
    final Finder aboutSection = find.text('about'.toUpperCase());

    // ASSERT
    expect(aboutSection, findsNothing);
  });
}
