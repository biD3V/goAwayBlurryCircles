#line 1 "Tweak.x"
BOOL enabled;
BOOL custom;
double brightness;
double saturation;
double tintAlpha;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class MTSystemModuleMaterialSettings; 
static double (*_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness)(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation)(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); static double (*_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha)(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST, SEL); 

#line 7 "Tweak.x"

static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (enabled == YES) {
		if (custom == YES) {
			return brightness;
		} else {
			return 0;
		}
	} else {
		return _logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness(self, _cmd);
	}
}
static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (enabled == YES) {
		if (custom == YES) {
			return saturation;
		} else {
			return 0;
		}
	} else {
		return _logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation(self, _cmd);
	}
}
static double _logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha(_LOGOS_SELF_TYPE_NORMAL MTSystemModuleMaterialSettings* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
	if (enabled == YES) {
		if (custom == YES) {
			return tintAlpha;
		} else {
			return 0;
		}
	} else {
		return _logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha(self, _cmd);
	}
}


static void loadPrefs() {
	NSString *preferencesPath = @"/User/Library/Preferences/com.biD3V.gabcprefs.plist";
	NSMutableDictionary *preferences = [[NSMutableDictionary alloc] initWithContentsOfFile:preferencesPath];
	if(!preferences) {
		preferences = [[NSMutableDictionary alloc] init];
		enabled = YES;
		custom = NO;
		brightness = 0;
		saturation = 0;
		tintAlpha = 0;
	} else {
		enabled = [[preferences objectForKey:@"enabled"] boolValue];
		custom = [[preferences objectForKey:@"custom"] boolValue];
		brightness = [[preferences objectForKey:@"brightness"] doubleValue];
		saturation = [[preferences objectForKey:@"saturation"] doubleValue];
		tintAlpha = [[preferences objectForKey:@"tintAlpha"] doubleValue];
	}
}

static NSString *nsNotificationString = @"com.biD3V.gabcprefs/preferences.changed";
static void notificationCallback(CFNotificationCenterRef center, void *observer, CFStringRef name, const void *object, CFDictionaryRef userInfo) {
	loadPrefs();
}

static __attribute__((constructor)) void _logosLocalCtor_c16daf74(int __unused argc, char __unused **argv, char __unused **envp) {
	loadPrefs();
	notificationCallback(NULL, NULL, NULL, NULL, NULL);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$MTSystemModuleMaterialSettings = objc_getClass("MTSystemModuleMaterialSettings"); MSHookMessageEx(_logos_class$_ungrouped$MTSystemModuleMaterialSettings, @selector(secondaryOverlayBrightness), (IMP)&_logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness, (IMP*)&_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayBrightness);MSHookMessageEx(_logos_class$_ungrouped$MTSystemModuleMaterialSettings, @selector(secondaryOverlaySaturation), (IMP)&_logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation, (IMP*)&_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlaySaturation);MSHookMessageEx(_logos_class$_ungrouped$MTSystemModuleMaterialSettings, @selector(secondaryOverlayTintAlpha), (IMP)&_logos_method$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha, (IMP*)&_logos_orig$_ungrouped$MTSystemModuleMaterialSettings$secondaryOverlayTintAlpha);} }
#line 72 "Tweak.x"
