#import "../../Utils.h"

%hook IGPendingRequestView
- (void)_onApproveButtonTapped {
    if ([SCIUtils getBoolPref:@"follow_request_confirm"]) {
        NSLog(@"[SCInsta] Confirm follow request triggered");

        void (^confirmBlock)(void) = ^{ %orig; };
        [SCIUtils showConfirmation:confirmBlock];
    } else {
        return %orig;
    }
}
- (void)_onIgnoreButtonTapped {
    if ([SCIUtils getBoolPref:@"follow_request_confirm"]) {
        NSLog(@"[SCInsta] Confirm follow request triggered");

        void (^confirmBlock)(void) = ^{ %orig; };
        [SCIUtils showConfirmation:confirmBlock];
    } else {
        return %orig;
    }
}
%end