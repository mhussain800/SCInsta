#import "../../Utils.h"

#define CONFIRM_STICKER(orig) \
    if ([SCIUtils getBoolPref:@"sticker_interact_confirm"]) { \
        NSLog(@"[SCInsta] Confirm sticker interact triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGStoryViewerTapTarget
- (void)_didTap:(id)arg1 forEvent:(id)arg2 {
    CONFIRM_STICKER(%orig);
}
%end
