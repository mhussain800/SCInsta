#import "../../Utils.h"

static void confirmComment(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"post_comment_confirm"]) {
        NSLog(@"[SCInsta] Confirm post comment triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

%hook IGCommentComposer.IGCommentComposerController
- (void)onSendButtonTap {
    void (^origBlock)(void) = ^{ %orig; };
    confirmComment(origBlock);
}
%end
