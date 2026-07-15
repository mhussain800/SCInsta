#import "../../Utils.h"

#define CONFIRM_COMMENT(orig) \
    if ([SCIUtils getBoolPref:@"post_comment_confirm"]) { \
        NSLog(@"[SCInsta] Confirm post comment triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGCommentComposer.IGCommentComposerController
- (void)onSendButtonTap {
    CONFIRM_COMMENT(%orig);
}
%end
