#import "../../InstagramHeaders.h"
#import "../../Utils.h"

#define CONFIRM_THEME(orig) \
    if ([SCIUtils getBoolPref:@"change_direct_theme_confirm"]) { \
        NSLog(@"[SCInsta] Confirm change direct theme triggered"); \
        [SCIUtils showConfirmation:^{ orig; }]; \
    } else { \
        orig; \
    }

%hook IGDirectThreadThemePickerViewController
- (void)themeNewPickerSectionController:(id)arg1 didSelectTheme:(id)arg2 atIndex:(NSInteger)arg3 {
    CONFIRM_THEME(%orig);
}
- (void)themePickerSectionController:(id)arg1 didSelectThemeId:(id)arg2 {
    CONFIRM_THEME(%orig);
}
%end

%hook IGDirectThreadThemeKitSwift.IGDirectThreadThemePreviewController
- (void)primaryButtonTapped {
    CONFIRM_THEME(%orig);
}
%end
