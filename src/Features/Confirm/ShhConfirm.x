#import "../../Utils.h"

#define CONFIRM_SHH(orig) \
    if ([SCIUtils getBoolPref:@"shh_mode_confirm"]) { \
        NSLog(@"[SCInsta] Confirm shh mode triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGDirectThreadViewController
- (void)swipeableScrollManagerDidEndDraggingAboveSwipeThreshold:(id)arg1 {
    CONFIRM_SHH(%orig);
}

- (void)shhModeTransitionButtonDidTap:(id)arg1 {
    CONFIRM_SHH(%orig);
}

- (void)messageListViewControllerDidToggleShhMode:(id)arg1 {
    CONFIRM_SHH(%orig);
}
%end
