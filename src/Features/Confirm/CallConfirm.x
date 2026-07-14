#import "../../Utils.h"

%hook IGDirectThreadCallButtonsCoordinator
// Voice Call
- (void)_didTapAudioButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"call_confirm"]) {
        NSLog(@"[SCInsta] Call confirm triggered");

        void (^confirmBlock)(void) = ^{ %orig; };
        [SCIUtils showConfirmation:confirmBlock];
    } else {
        return %orig;
    }
}

// Video Call
- (void)_didTapVideoButton:(id)arg1 {
    if ([SCIUtils getBoolPref:@"call_confirm"]) {
        NSLog(@"[SCInsta] Call confirm triggered");
        
        void (^confirmBlock)(void) = ^{ %orig; };
        [SCIUtils showConfirmation:confirmBlock];
    } else {
        return %orig;
    }
}
%end