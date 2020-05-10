xcode-select --install

## brew

```shell
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

sudo easy_install Pygments

###############################################################################
# PREINSTALL
###############################################################################

osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################



###############################################################################
# 📱 Dock
###############################################################################

defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.05
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 54
defaults write com.apple.dock largesize -int 64
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock show-process-indicators -bool true

## Adjust Dock apps

defaults write com.apple.dock persistent-apps -array
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394300;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 0b000000 01010000 4b65796e 6f74652e 61707000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 26b61100 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41c0a51f 3d800000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b3000000 01020000 30366334 31306166 63356334 30316632 31663265 63333463 36323036 61356166 31313533 34616233 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303031 31623632 363b3031 3b2f6170 706c6963 6174696f 6e732f6b 65796e6f 74652e61 70700000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = "com.apple.iWork.Keynote";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Keynote.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = Keynote;
		"file-mod-date" = 216727672879174;
		"file-type" = 41;
		"parent-mod-date" = 259561381838519;
	};
	"tile-type" = "file-tile";
}'

defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394299;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 0a000000 01010000 694d6f76 69652e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 ae6a1600 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41b8d176 b3000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b2000000 01020000 32366563 33663837 61616630 62653435 34366338 35393166 32646532 37343866 64376136 30643266 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303031 36366161 653b3031 3b2f6170 706c6963 6174696f 6e732f69 6d6f7669 652e6170 70000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = "com.apple.iMovieApp";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/iMovie.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = iMovie;
		"file-mod-date" = 21834941889347;
		"file-type" = 41;
		"parent-mod-date" = 259561381838519;
	};
	"tile-type" = "file-tile";
}'

defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 3976413400;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 0b000000 01010000 53706f74 6966792e 61707000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 19242d00 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41c0b294 e0800000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b3000000 01020000 64623862 66333330 34636430 33303064 63623431 62393530 64303531 38623462 31386239 33343033 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303032 64323431 393b3031 3b2f6170 706c6963 6174696f 6e732f73 706f7469 66792e61 70700000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = "com.spotify.client";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Spotify.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = Spotify;
		"file-mod-date" = 39341228598227;
		"file-type" = 41;
		"parent-mod-date" = 33951044660432;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 3976413399;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 0c000000 01010000 57686174 73417070 2e617070 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 0edc0c00 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41c0bc86 b3800000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b4000000 01020000 64336563 30363263 66346465 61376230 39383963 66346638 61333136 64623333 37313234 30613834 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303030 63646330 653b3031 3b2f6170 706c6963 6174696f 6e732f77 68617473 6170702e 61707000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = WhatsApp;
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/WhatsApp.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = WhatsApp;
		"file-mod-date" = 3622733415;
		"file-type" = 41;
		"parent-mod-date" = 33951044660432;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394297;
	"tile-data" =         {
		book = <626f6f6b ec020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 0c020000 0c000000 01010000 4170706c 69636174 696f6e73 11000000 01010000 476f6f67 6c652043 68726f6d 652e6170 70000000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 cd820c00 00000000 08000000 01060000 44000000 54000000 08000000 00040000 41c0baad f2000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b9000000 01020000 31346461 33373131 61616535 34333435 32353164 39363861 66313936 38643165 64353966 66396539 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303030 63383263 643b3031 3b2f6170 706c6963 6174696f 6e732f67 6f6f676c 65206368 726f6d65 2e617070 00000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 34000000 00000000 05100000 64000000 00000000 10100000 84000000 00000000 40100000 74000000 00000000 02200000 34010000 00000000 05200000 a4000000 00000000 10200000 b4000000 00000000 11200000 e8000000 00000000 12200000 c8000000 00000000 13200000 d8000000 00000000 20200000 14010000 00000000 30200000 40010000 00000000 80f00000 48010000 00000000>;
		"bundle-identifier" = "com.google.Chrome";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Google%20Chrome.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = "Google Chrome";
		"file-mod-date" = 0;
		"file-type" = 1;
		"parent-mod-date" = 0;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394298;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 09000000 01010000 536c6163 6b2e6170 70000000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 c0d80c00 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41c0aeb3 f3000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b1000000 01020000 63636539 64343638 38306439 38373634 38326239 61613061 62643262 37653731 35633230 62393666 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303030 63643863 303b3031 3b2f6170 706c6963 6174696f 6e732f73 6c61636b 2e617070 00000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = "com.tinyspeck.slackmacgap";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Slack.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = Slack;
		"file-mod-date" = 0;
		"file-type" = 1;
		"parent-mod-date" = 0;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394303;
	"tile-data" =         {
		book = <626f6f6b dc020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 fc010000 0c000000 01010000 4170706c 69636174 696f6e73 0a000000 01010000 5472656c 6c6f2e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 aa361600 00000000 08000000 01060000 3c000000 4c000000 08000000 00040000 41c08c65 ac800000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b2000000 01020000 34373163 66633662 35343931 34366432 65326637 38613364 37303731 30303663 66663965 32313534 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303031 36333661 613b3031 3b2f6170 706c6963 6174696f 6e732f74 72656c6c 6f2e6170 70000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 2c000000 00000000 05100000 5c000000 00000000 10100000 7c000000 00000000 40100000 6c000000 00000000 02200000 2c010000 00000000 05200000 9c000000 00000000 10200000 ac000000 00000000 11200000 e0000000 00000000 12200000 c0000000 00000000 13200000 d0000000 00000000 20200000 0c010000 00000000 30200000 38010000 00000000 80f00000 40010000 00000000>;
		"bundle-identifier" = "com.atlassian.trello";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Trello.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = Trello;
		"file-mod-date" = 74598615119981;
		"file-type" = 41;
		"parent-mod-date" = 259561381838519;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 1992394302;
	"tile-data" =         {
		book = <626f6f6b e4020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 04020000 0c000000 01010000 4170706c 69636174 696f6e73 0e000000 01010000 536f7572 63657472 65652e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 6af10c00 00000000 08000000 01060000 40000000 50000000 08000000 00040000 41c0653c 0f000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 b6000000 01020000 35373861 61313034 66666431 38316261 35366566 66646638 64363339 30353736 31373666 34633439 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303030 63663136 613b3031 3b2f6170 706c6963 6174696f 6e732f73 6f757263 65747265 652e6170 70000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 30000000 00000000 05100000 60000000 00000000 10100000 80000000 00000000 40100000 70000000 00000000 02200000 30010000 00000000 05200000 a0000000 00000000 10200000 b0000000 00000000 11200000 e4000000 00000000 12200000 c4000000 00000000 13200000 d4000000 00000000 20200000 10010000 00000000 30200000 3c010000 00000000 80f00000 44010000 00000000>;
		"bundle-identifier" = "com.torusknot.SourceTreeNotMAS";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Sourcetree.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = Sourcetree;
		"file-mod-date" = 3611291934;
		"file-type" = 41;
		"parent-mod-date" = 259561381838519;
	};
	"tile-type" = "file-tile";
}'
defaults write com.apple.dock persistent-apps -array-add '{
	GUID = 3976413398;
	"tile-data" =         {
		book = <626f6f6b f4020000 00000410 30000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 14020000 0c000000 01010000 4170706c 69636174 696f6e73 16000000 01010000 56697375 616c2053 74756469 6f20436f 64652e61 70700000 08000000 01060000 04000000 18000000 08000000 04030000 8d010000 00000000 08000000 04030000 870d0d00 00000000 08000000 01060000 48000000 58000000 08000000 00040000 41c0a425 b0000000 18000000 01020000 02000000 00000000 0f000000 00000000 00000000 00000000 08000000 01090000 66696c65 3a2f2f2f 0c000000 01010000 536f6d61 63686967 756e4844 08000000 04030000 008088e0 2e000000 08000000 00040000 41c0bf74 ef2f0619 24000000 01010000 43353444 35374542 2d394543 352d3430 38452d39 4439412d 41423738 33363042 30314638 18000000 01020000 81000000 01000000 ef130000 01000000 00000000 00000000 01000000 01010000 2f000000 00000000 01050000 be000000 01020000 33646566 35343361 36333835 65326137 66393965 62343634 38373065 32653030 36666236 33303536 3b30303b 30303030 30303030 3b303030 30303030 303b3030 30303030 30303b30 30303030 30303030 30303030 3032303b 636f6d2e 6170706c 652e6170 702d7361 6e64626f 782e7265 61642d77 72697465 3b30313b 30313030 30303036 3b303030 30303030 30303030 64306438 373b3031 3b2f6170 706c6963 6174696f 6e732f76 69737561 6c207374 7564696f 20636f64 652e6170 70000000 a8000000 feffffff 01000000 00000000 0d000000 04100000 38000000 00000000 05100000 68000000 00000000 10100000 88000000 00000000 40100000 78000000 00000000 02200000 38010000 00000000 05200000 a8000000 00000000 10200000 b8000000 00000000 11200000 ec000000 00000000 12200000 cc000000 00000000 13200000 dc000000 00000000 20200000 18010000 00000000 30200000 44010000 00000000 80f00000 4c010000 00000000>;
		"bundle-identifier" = "com.microsoft.VSCode";
		"dock-extra" = 0;
		"file-data" =             {
			"_CFURLString" = "file:///Applications/Visual%20Studio%20Code.app/";
			"_CFURLStringType" = 15;
		};
		"file-label" = "Visual Studio Code";
		"file-mod-date" = 0;
		"file-type" = 1;
		"parent-mod-date" = 0;
	};
	"tile-type" = "file-tile";
}'

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'


###############################################################################
# 🎛 Mission Control
###############################################################################

defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center

# Top left screen corner → Show application windows
defaults write com.apple.dock wvous-tl-corner -int 3
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Mission Control
defaults write com.apple.dock wvous-tr-corner -int 2
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Notification Center
defaults write com.apple.dock wvous-bl-corner -int 12
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Desktop
defaults write com.apple.dock wvous-br-corner -int 4
defaults write com.apple.dock wvous-br-modifier -int 0

killall Dock


###############################################################################
# ⌨️ Keyboard
###############################################################################

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 10
adkjasjkdaskj
# Disable press-and-hold for keys in favour of key repeat
defaults write -g ApplePressAndHoldEnabled -bool false

# Shortcut to maximize window
defaults write -g NSUserKeyEquivalents -dict-add "Zoom" -string "@~^f"

# Disable automatic modifications of entered text
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false


###############################################################################
# 🖱️ Mouse
###############################################################################

# Increase speed
defaults write -g com.apple.mouse.scaling 5

# Enable secondary button on click
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton

# Enable swipe with one single finger gesture to go back while browsing
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseOneFingerDoubleTapGesture 1

###############################################################################
# 💻 Trackpad
###############################################################################

# Tracking Speed: from 0 to 3
defaults write -g com.apple.trackpad.scaling -float 3

# Enable tap to click for the current user and the login screen. (Don't have to press down on the trackpad -- just tap it.)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults -currentHost write -g com.apple.mouse.tapBehavior -int 1
defaults write -g com.apple.mouse.tapBehavior -int 1

# Trackpad: map two fingers tap to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write -g com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write -g com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -int 1


###############################################################################
# 📂 Finder
###############################################################################

defaults write com.apple.finder AppleShowAllFiles TRUE
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write -g AppleShowAllExtensions -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/'
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FinderSpawnTab -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Toolbar icons
defaults write com.apple.finder 'NSToolbar Configuration Browser' '{
    "TB Default Item Identifiers" =     (
        "com.apple.finder.BACK",
        NSToolbarFlexibleSpaceItem,
        "com.apple.finder.SWCH",
        "com.apple.finder.ARNG",
        "com.apple.finder.ACTN",
        "com.apple.finder.SHAR",
        "com.apple.finder.LABL",
        NSToolbarFlexibleSpaceItem,
        NSToolbarFlexibleSpaceItem,
        "com.apple.finder.SRCH"
    );
    "TB Display Mode" = 2;
    "TB Icon Size Mode" = 1;
    "TB Is Shown" = 1;
    "TB Item Identifiers" =     (
        "com.apple.finder.BACK",
        NSToolbarFlexibleSpaceItem,
        "com.apple.finder.SWCH",
        "com.apple.finder.ARNG",
        NSToolbarSpaceItem,
        "com.apple.finder.NFLD",
        NSToolbarFlexibleSpaceItem,
        "com.apple.finder.SRCH"
    );
    "TB Size Mode" = 1;
}'

# Modify behaviour for "Save" modal window
defaults write -g NSDocumentSaveNewDocumentsToCloud -bool false
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true

# Enable spring loading for directories: https://www.youtube.com/watch?v=F9kdAxGe9SE
defaults write -g com.apple.springing.enabled -bool true
defaults write -g com.apple.springing.delay -float 0

# Automatically open a new Finder window when a volume is mounted
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# Increase grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
killall Finder

# Show Sidebar, but remove the Tags section.
defaults write com.apple.finder ShowSidebar -bool true
defaults write com.apple.finder ShowRecentTags -bool false

###############################################################################
# 🔍 Spotlight
###############################################################################

# Limit number of things to index
defaults write com.apple.spotlight orderedItems -array \
	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
	'{"enabled" = 1;"name" = "MENU_CONVERSION";}' \
	'{"enabled" = 1;"name" = "MENU_EXPRESSION";}' \
	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
	'{"enabled" = 1;"name" = "PRESENTATIONS";}' \
	'{"enabled" = 1;"name" = "SPREADSHEETS";}' \
	'{"enabled" = 1;"name" = "PDF";}' \
	'{"enabled" = 1;"name" = "IMAGES";}' \
	'{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
	'{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
	'{"enabled" = 0;"name" = "MESSAGES";}' \
	'{"enabled" = 0;"name" = "CONTACT";}' \
	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
	'{"enabled" = 0;"name" = "MUSIC";}' \
	'{"enabled" = 0;"name" = "MOVIES";}' \
	'{"enabled" = 0;"name" = "FONTS";}' \
	'{"enabled" = 0;"name" = "MENU_OTHER";}' \
	'{"enabled" = 0;"name" = "SOURCE";}' \
	'{"enabled" = 0;"name" = "MENU_WEBSEARCH";}'

# Load new settings before rebuilding the index
killall mds > /dev/null 2>&1

# Make sure indexing is enabled for the main volume
sudo mdutil -i on / > /dev/null

# Rebuild the index from scratch
sudo mdutil -E / > /dev/null

# Do not search inside external drives (WIP)

###############################################################################
# 🌍 Safari & WebKit
###############################################################################

# Allow hitting the Backspace key to go to the previous page in history
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

# Add a context menu item for showing the Web Inspector in web views
defaults write -g WebKitDeveloperExtras -bool true

defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

###############################################################################
# 🍎 Mac App Store
###############################################################################

defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

###############################################################################
# 🎚️ Others
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

defaults write -g AppleShowScrollBars -string "Always"
defaults write -g NSWindowResizeTime -float 0.001

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze on

# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Font rendering for non-retina displays. More info: https://github.com/Microsoft/vscode/issues/51132
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false

# Set computer name (as done via System Preferences → Sharing)
COMPUTER_NAME="RoySurjano"

sudo scutil --set ComputerName $COMPUTER_NAME
sudo scutil --set HostName $COMPUTER_NAME
sudo scutil --set LocalHostName $COMPUTER_NAME
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $COMPUTER_NAME

# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Show the ~/Library folder
chflags nohidden ~/Library

# Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots

# Kill affected applications
for app in "cfprefsd" \
  "Dock" \
  "Finder" \
  "SystemUIServer"; do
  killall "${app}" &> /dev/null
done

## VSCODE

DOTFILES_DIR="/rsurj/dotfiles"
rm -rf ~/Library/Application\ Support/Code/User/snippets
ln -fs $DOTFILES_DIR/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fs $DOTFILES_DIR/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -fs $DOTFILES_DIR/.vscode/snippets/ ~/Library/Application\ Support/Code/User

# PHP installation for MAC guide https://getgrav.org/blog/macos-mojave-apache-multiple-php-versions

## APACHE CONFIGURATION

sudo apachectl stop
sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist 2>/dev/null

brew install httpd
# ps -aef | grep httpd
# sudo apachectl -k restart
# $ sudo apachectl start
# $ sudo apachectl stop
# $ sudo apachectl -k restart

## PHP Switcher Script

curl -L https://gist.githubusercontent.com/rhukster/f4c04f1bf59e0b74e335ee5d186a98e2/raw > /usr/local/bin/sphp
chmod +x /usr/local/bin/sphp
