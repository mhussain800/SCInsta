#import "../../Utils.h"

%hook IGDirectThreadCallButtonsCoordinator
// Voice Call
- (void)_didTapAudioButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    
    if ([SCIUtils getBoolPref:@"call_confirm"]) {
        NSLog(@"[SCInsta] Call confirm triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

// Video Call
- (void)_didTapVideoButton:(id)arg1 {
    void (^origBlock)(void) = ^{ %orig; };
    
    if ([SCIUtils getBoolPref:@"call_confirm"]) {
        NSLog(@"[SCInsta] Call confirm triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}
%end
