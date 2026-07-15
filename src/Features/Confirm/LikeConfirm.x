#import "../../Utils.h"

///////////////////////////////////////////////////////////

static void confirmPostLike(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"like_confirm"]) {
        NSLog(@"[SCInsta] Confirm post like triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

static void confirmReelsLike(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"like_confirm_reels"]) {
        NSLog(@"[SCInsta] Confirm reels like triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

///////////////////////////////////////////////////////////

// Liking posts
%hook IGUFIButtonBarView
- (void)_onLikeButtonPressed:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end
%hook IGFeedPhotoView
- (void)_onDoubleTap:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end
%hook IGVideoPlayerOverlayContainerView
- (void)_handleDoubleTapGesture:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end

// Liking reels
%hook IGSundialViewerVideoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
- (void)controlsOverlayControllerDidLongPressLikeButton:(id)arg1 gestureRecognizer:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
%end
%hook IGSundialViewerPhotoCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
%end
%hook IGSundialViewerCarouselCell
- (void)controlsOverlayControllerDidTapLikeButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
- (void)gestureController:(id)arg1 didObserveDoubleTap:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmReelsLike(origBlock);
}
%end

// Liking comments
%hook IGCommentCellController
- (void)commentCell:(id)arg1 didTapLikeButton:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)commentCell:(id)arg1 didTapLikedByButtonForUser:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)commentCellDidLongPressOnLikeButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)commentCellDidEndLongPressOnLikeButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)commentCellDidDoubleTap:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end
%hook IGFeedItemPreviewCommentCell
- (void)_didTapLikeButton {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end

// Liking stories
%hook IGStoryFullscreenDefaultFooterView
- (void)_handleLikeTapped {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)_likeTapped {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
- (void)inputView:(id)arg1 didTapLikeButton:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
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

    [SCIUtils showConfirmation:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [likeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
        });
    }];
}
%end

// DM like button (seems to be hidden)
%hook IGDirectThreadViewController
- (void)_didTapLikeButton {
    void (^origBlock)(void) = ^{ %orig; };
    confirmPostLike(origBlock);
}
%end
