#import <UIKit/UIKit.h>
#include <dlfcn.h>

%ctor{
    NSLog(@"[Lookin] Tweak loaded!");
	@autoreleasepool {
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString* prefix = @"/var/jb";
        NSString* plistPath = [prefix stringByAppendingString:@"/var/mobile/Library/Preferences/com.yourcompany.lookinloaderrootless.plist"];
        NSDictionary* lookinSettings = [NSDictionary dictionaryWithContentsOfFile:plistPath];
        NSArray *selectedApps = [lookinSettings objectForKey:@"selectedApplications"];
		NSString* bundleID = [[NSBundle mainBundle] bundleIdentifier];
        if([selectedApps containsObject:bundleID]) {
            NSLog(@"[Lookin] Enabled LookinLoader with %@", bundleID);
            NSString* libPath = [prefix stringByAppendingString:@"/Library/Application Support/LookinLoader/LookinServer.framework/LookinServer"];
            if([fileManager fileExistsAtPath:libPath]) {
                void *lib = dlopen([libPath UTF8String], RTLD_NOW);
                if (lib) {
                    NSLog(@"[Lookin] LookinLoader loaded!");
                }else {
                    char* err = dlerror();
                    NSLog(@"[Lookin] LookinLoader load failed:%s",err);
                }
            }else {
                NSLog(@"[Lookin] LookinServer not found!");
            }
        }
	}
}
