#import "../../Utils.h"

// Liking posts
%hook IGUFIButtonBarView
- (void)_onLikeButtonPressed:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
%hook IGFeedPhotoView
- (void)_onDoubleTap:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
%hook IGVideoPlayerOverlayContainerView
- (void)_handleDoubleTapGesture:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end

// Liking reels
%hook IGSundialViewerVideoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)controlsOverlayControllerDidLongPressLikeButton:(id)arg1 gestureRecognizer:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
%hook IGSundialViewerPhotoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
%hook IGSundialViewerCarouselCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end

// Liking comments
%hook IGCommentCellController
- (void)commentCell:(id)arg1 didTapLikeButton:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)commentCell:(id)arg1 didTapLikedByButtonForUser:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)commentCellDidLongPressOnLikeButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)commentCellDidEndLongPressOnLikeButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)commentCellDidDoubleTap:(id)arg1 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
%hook IGFeedItemPreviewCommentCell
- (void)_didTapLikeButton {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end

// Liking stories
%hook IGStoryFullscreenDefaultFooterView
- (void)_handleLikeTapped {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)_likeTapped {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
- (void)inputView:(id)arg1 didTapLikeButton:(id)arg2 {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}

// For some stupid reason they removed the "liketapped" methods on newer Instagram versions
// Now we have to do a shitty workaround instead :(
// Works 99% of the time, but sometimes clicks get through directly to the like button (somehow)
- (void)layoutSubviews {
    %orig;

    if (![SCIUtils getBoolPref:@"like_confirm"]) return;

    UIButton *likeButton = [self valueForKey:@"likeButton"];
    if (!likeButton) return;

    // 129115 = L(12) I(9) K(11) E(5)
    static NSInteger kOverlayTag = 129115;
    if ([likeButton viewWithTag:kOverlayTag]) return;

    UIButton *overlay = [UIButton buttonWithType:UIButtonTypeCustom];
    overlay.tag = kOverlayTag;
    overlay.frame = likeButton.bounds;
    overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [overlay addTarget:self action:@selector(overlayTapped:) forControlEvents:UIControlEventTouchUpInside];
    [likeButton addSubview:overlay];
}

%new - (void)overlayTapped:(UIButton *)overlay {
    UIButton *likeButton = (UIButton *)overlay.superview;

    [SCIUtils showConfirmation:^(void) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [likeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        });
    }];
}
%end

// DM like button (seems to be hidden)
%hook IGDirectThreadViewController
- (void)_didTapLikeButton {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:^(void) {
            %orig;
        }];
    } else {
        %orig;
    }
}
%end
