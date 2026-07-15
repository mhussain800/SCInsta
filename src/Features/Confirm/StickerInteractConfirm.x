#import "../../Utils.h"

static void confirmSticker(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"sticker_interact_confirm"]) {
        NSLog(@"[SCInsta] Confirm sticker interact triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

%hook IGStoryViewerTapTarget
- (void)_didTap:(id)arg1 forEvent:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    confirmSticker(origBlock);
}
%end
