#import "../../InstagramHeaders.h"
#import "../../Utils.h"

%hook IGDirectThreadThemePickerViewController
- (void)themeNewPickerSectionController:(id)arg1 didSelectTheme:(id)arg2 atIndex:(NSInteger)arg3 {
    void (^origBlock)(void) = ^{ %orig; };
    
    if ([SCIUtils getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Confirm change direct theme triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}

- (void)themePickerSectionController:(id)arg1 didSelectThemeId:(id)arg2 {
    void (^origBlock)(void) = ^{ %orig; };
    
    if ([SCIUtils getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Confirm change direct theme triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}
%end

%hook IGDirectThreadThemeKitSwift.IGDirectThreadThemePreviewController
- (void)primaryButtonTapped {
    void (^origBlock)(void) = ^{ %orig; };
    
    if ([SCIUtils getBoolPref:@"change_direct_theme_confirm"]) {
        NSLog(@"[SCInsta] Confirm change direct theme triggered");
        [SCIUtils showConfirmation:origBlock];
    } else {
        origBlock();
    }
}
%end
