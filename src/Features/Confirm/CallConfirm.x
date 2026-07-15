#import "../../Utils.h"

#define CONFIRM_CALL(orig) \
    if ([SCIUtils getBoolPref:@"call_confirm"]) { \
        NSLog(@"[SCInsta] Call confirm triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGDirectThreadCallButtonsCoordinator
// Voice Call
- (void)_didTapAudioButton:(id)arg1 {
    CONFIRM_CALL(%orig);
}

// Video Call
- (void)_didTapVideoButton:(id)arg1 {
    CONFIRM_CALL(%orig);
}
%end
