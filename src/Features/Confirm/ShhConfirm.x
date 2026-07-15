#import "../../Utils.h"

static void confirmShh(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"shh_mode_confirm"]) {
        NSLog(@"[SCInsta] Confirm shh mode triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

%hook IGDirectThreadViewController
- (void)swipeableScrollManagerDidEndDraggingAboveSwipeThreshold:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmShh(origBlock);
}

- (void)shhModeTransitionButtonDidTap:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmShh(origBlock);
}

- (void)messageListViewControllerDidToggleShhMode:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmShh(origBlock);
}
%end
