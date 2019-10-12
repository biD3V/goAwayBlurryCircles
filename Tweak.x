BOOL enabled;
BOOL custom;
double brightness;
double saturation;
double tintAlpha;

%hook MTSystemModuleMaterialSettings
-(double)secondaryOverlayBrightness {
	if (enabled == YES) {
		if (custom == YES) {
			return brightness;
		} else {
			return 0;
		}
	} else {
		return %orig;
	}
}
-(double)secondaryOverlaySaturation {
	if (enabled == YES) {
		if (custom == YES) {
			return saturation;
		} else {
			return 0;
		}
	} else {
		return %orig;
	}
}
-(double)secondaryOverlayTintAlpha {
	if (enabled == YES) {
		if (custom == YES) {
			return tintAlpha;
		} else {
			return 0;
		}
	} else {
		return %orig;
	}
}
%end

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

%ctor {
	loadPrefs();
	notificationCallback(NULL, NULL, NULL, NULL, NULL);
	CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, notificationCallback, (CFStringRef)nsNotificationString, NULL, CFNotificationSuspensionBehaviorCoalesce);
}
