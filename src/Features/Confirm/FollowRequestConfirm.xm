#import "../../Utils.h"

#define CONFIRM_FOLLOW_REQUEST(orig) \
    if ([SCIUtils getBoolPref:@"follow_request_confirm"]) { \
        NSLog(@"[SCInsta] Confirm follow request triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGPendingRequestView
- (void)_onApproveButtonTapped {
    CONFIRM_FOLLOW_REQUEST(%orig);
}
- (void)_onIgnoreButtonTapped {
    CONFIRM_FOLLOW_REQUEST(%orig);
}
%end
