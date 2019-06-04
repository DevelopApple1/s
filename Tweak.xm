//Needed to play audio
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>
#import <UIKit/UIKit.h>

//Definitions for usage
#define kIdentifier @"com.yakir.alertspercent"
#define kSettingsChangedNotification (CFStringRef)@"com.yakir.alertspercent/ReloadPrefs"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.yakir.alertspercent.plist"

//Variables from the preference file
static NSString *bundlePrefix = @"/Library/MobileSubstrate/DynamicLibraries/com.yakir.alertspercent.bundle";
static BOOL enabled;
static BOOL lowenabled;
static NSInteger batPercent;
static NSInteger lowbatPercent;
static NSInteger sound;
static NSInteger lowsound;

//Creates the audio player
AVAudioPlayer *player;
AVAudioPlayer *lowplayer;

//Hooks the needed method
%hook UIDevice
  -(void)_setBatteryLevel:(float)arg1 {
    //Runs the original code
    %orig;

    //Creates a UIDevice object which is used to get the battery level and store it in 'batLeft'
    UIDevice *dev = [UIDevice currentDevice];
    float batLeft = [dev batteryLevel]*100;

    //Formats the string with the remaining battery so it can be used
    NSString *batString = [NSString stringWithFormat:@"%0.0f", batLeft];

    //Formats our preference integer into a string for comparison
    // //We have to cast our integer as a long because the compiler likes it like that
    NSString *batPercent_String = [NSString stringWithFormat:@"%ld", (long)batPercent];
    NSString *lowbatPercent_String = [NSString stringWithFormat:@"%ld", (long)lowbatPercent];

    //Sound player path variables
    NSString *soundFilePath = nil;
    NSURL *soundFileURL;

    //Runs the code IF the tweak is ENABLED
    if (enabled) {
      //If its our percent value and hasn't played yet
      if ([batString isEqualToString:batPercent_String]) {
        // // YES: Play the healing sound
        if (player) {
          return;
        }

        //Sets the sound paths sound
        if (sound == 0)
       
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario.mp3", bundlePrefix];
else if (sound == 1)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 1.mp3", bundlePrefix];
else if (sound == 2)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 2.mp3", bundlePrefix];
else if (sound == 3)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 3.mp3", bundlePrefix];
else if (sound == 4)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 4.mp3", bundlePrefix];
else if (sound == 5)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 5.mp3", bundlePrefix];
else if (sound == 6)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 6.mp3", bundlePrefix];
else if (sound == 7)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 7.mp3", bundlePrefix];
else if (sound == 8)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 8.mp3", bundlePrefix];
else if (sound == 9)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 9.mp3", bundlePrefix];
else if (sound == 10)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 10.mp3", bundlePrefix];
else if (sound == 11)
soundFilePath = [NSString stringWithFormat:@"%@/sos morse code.wav", bundlePrefix];
else if (sound == 12)
soundFilePath = [NSString stringWithFormat:@"%@/service bell.wav", bundlePrefix];
else if (sound == 13)
soundFilePath = [NSString stringWithFormat:@"%@/Samsung Low battery Sound Effect.mp3", bundlePrefix];
else if (sound == 14)
soundFilePath = [NSString stringWithFormat:@"%@/Music Box.wav", bundlePrefix];
else if (sound == 15)
soundFilePath = [NSString stringWithFormat:@"%@/Electrical.wav", bundlePrefix];

else if (sound == 16)
soundFilePath = [NSString stringWithFormat:@"%@/Doorbell.wav", bundlePrefix];
else if (sound == 17)
soundFilePath = [NSString stringWithFormat:@"%@/bell.wav", bundlePrefix];
else if (sound == 18)
soundFilePath = [NSString stringWithFormat:@"%@/alert.wav", bundlePrefix];

        //Grabs the sound file from the bundle path and makes the NSURL equal to it
        soundFileURL = [NSURL fileURLWithPath:soundFilePath];

        //Makes the audio player object and plays the sound 0(actually 1) time(s)
        player = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        player.numberOfLoops = 3;

        [player play];
      } else {
        if (player) {
          player = nil;
        }
      }
    }

    //Same as above but with the low variables instead
    if (lowenabled) {
      if ([batString isEqualToString:lowbatPercent_String]) {
        if (lowplayer) {
          return;
        }

        if (lowsound == 0)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario.mp3", bundlePrefix];
        else if (lowsound == 1)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 1.mp3", bundlePrefix];
        else if (lowsound == 2)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 2.mp3", bundlePrefix];
        else if (lowsound == 3)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 3.mp3", bundlePrefix];
        else if (lowsound == 4)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 4.mp3", bundlePrefix];
        else if (lowsound == 5)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 5.mp3", bundlePrefix];
         else if (lowsound == 6)
          soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 6.mp3", bundlePrefix];
 else if (lowsound == 7)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 7.mp3", bundlePrefix];
 else if (lowsound == 8)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 8.mp3", bundlePrefix];
 else if (lowsound == 9)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 9.mp3", bundlePrefix];
 else if (lowsound == 10)
soundFilePath = [NSString stringWithFormat:@"%@/Super Mario 10.mp3", bundlePrefix];
 else if (lowsound == 11)
soundFilePath = [NSString stringWithFormat:@"%@/sos morse code.wav", bundlePrefix];
 else if (lowsound == 12)
soundFilePath = [NSString stringWithFormat:@"%@/service bell.wav", bundlePrefix];
 else if (lowsound == 13)
soundFilePath = [NSString stringWithFormat:@"%@/Samsung Low battery Sound Effect.mp3", bundlePrefix];
 else if (lowsound == 14)
soundFilePath = [NSString stringWithFormat:@"%@/Music Box.wav", bundlePrefix];
 else if (lowsound == 15)
soundFilePath = [NSString stringWithFormat:@"%@/Electrical.wav", bundlePrefix];

 else if (lowsound == 16)
soundFilePath = [NSString stringWithFormat:@"%@/Doorbell.wav", bundlePrefix];
 else if (lowsound == 17)
soundFilePath = [NSString stringWithFormat:@"%@/bell.wav", bundlePrefix];
 else if (lowsound == 18)
soundFilePath = [NSString stringWithFormat:@"%@/alert.wav", bundlePrefix];

        soundFileURL = [NSURL fileURLWithPath:soundFilePath];

        lowplayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
        lowplayer.numberOfLoops = 3;

        [lowplayer play];
      } else {
        if (lowplayer) {
          lowplayer = nil;
        }
      }
    }
}


%end

//Reloads the Preferences
static void reloadPrefs() {
  //Identifies our tweak
  CFPreferencesAppSynchronize((CFStringRef)kIdentifier);

  //Defines our dictionary and adds the values
  NSDictionary *prefs = nil;
  if ([NSHomeDirectory() isEqualToString:@"/var/mobile"]) {
    CFArrayRef keys = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

    if (keys != nil) {
      prefs = (NSDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keys, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost));

      if (prefs == nil) {
        prefs = [NSDictionary dictionary];
      }
      CFRelease(keys);
    }
  } else {
    prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
  }

  //Assigns the values that are in the prefs Dictionary into our variables
  enabled = [prefs objectForKey:@"enabled"] ? [(NSNumber *)[prefs objectForKey:@"enabled"] boolValue] : false;
  batPercent = [prefs objectForKey:@"batPercent"] ? [[prefs objectForKey:@"batPercent"] integerValue] : 100;
  lowenabled = [prefs objectForKey:@"lowenabled"] ? [(NSNumber *)[prefs objectForKey:@"lowenabled"] boolValue] : false;
  lowbatPercent = [prefs objectForKey:@"lowbatPercent"] ? [[prefs objectForKey:@"lowbatPercent"] integerValue] : 20;
  sound = [prefs objectForKey:@"sound"] ? [[prefs objectForKey:@"sound"] integerValue] : 0;
  lowsound = [prefs objectForKey:@"lowsound"] ? [[prefs objectForKey:@"lowsound"] integerValue] : 1;
}


//The constructor of our tweak (What gets loaded before anything else, in a sense the "entry point" of our tweak)
// // Make sure it's at the end so everything gets loaded into memory first and then can construct
%ctor {
  reloadPrefs();
  CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)reloadPrefs, kSettingsChangedNotification, NULL, CFNotificationSuspensionBehaviorDeliverImmediately);
}
