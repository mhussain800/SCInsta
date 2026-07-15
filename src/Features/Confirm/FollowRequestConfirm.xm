#import "../../Utils.h"

static void confirmFollowRequest(void (^origBlock)(void)) {
    if ([SCIUtils getBoolPref:@"follow_request_confirm"]) {
        NSLog(@"[SCInsta] Confirm follow request triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

%hook IGPendingRequestView
- (void)_onApproveButtonTapped {
    void (^origBlock)(void) = ^{ %orig; };
    confirmFollowRequest(origBlock);
}
- (void)_onIgnoreButtonTapped {
    void (^origBlock)(void) = ^{ %orig; };
    confirmFollowRequest(origBlock);
}
%end
