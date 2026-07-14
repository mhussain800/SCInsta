#import "../../Utils.h"

%hook IGCommentComposer.IGCommentComposerController
- (void)onSendButtonTap {
    if ([SCIUtils getBoolPref:@"post_comment_confirm"]) {
        NSLog(@"[SCInsta] Confirm post comment triggered");

        void (^confirmBlock)(void) = ^{ %orig; };
        [SCIUtils showConfirmation:confirmBlock];
    } else {
        return %orig;
    }
}
%end