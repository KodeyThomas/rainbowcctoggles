#import <UIKit/UIKit.h>


BOOL Enabled = false;
float timesl = 2;
NSTimeInterval timeg;

static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.github.airketchplayz.rainbowccswitchesprefs.plist"];
    if(prefs)
    {
        Enabled = ( [prefs objectForKey:@"Enabled"] ? [[prefs objectForKey:@"Enabled"] boolValue] : Enabled );
    }
}

%ctor 
{
	timeg = timesl;
    loadPrefs();
}


@interface CCUIRoundButton : UIControl
@property(nonatomic, retain)UIView* selectedStateBackgroundView;
@end


%hook CCUIRoundButton
%property(nonatomic, assign)BOOL running;
-(id)initWithHighlightColor:(id)arg1 useLightStyle:(BOOL)arg2 {

	[NSTimer scheduledTimerWithTimeInterval:timeg
	target: self
	selector:@selector(targetMethod:)
	userInfo:[NSDictionary dictionaryWithObject:self 
				forKey:@"name"]
	repeats:YES];
	return %orig;
}



%new
- (void)targetMethod: (NSTimer *)timer {

	if (Enabled) {
		CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
		CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from white
		CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0, away from black
		UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
		[UIView animateWithDuration:timeg animations:^{
			self.selectedStateBackgroundView.backgroundColor = color;
		} completion:NULL];
	}
}

%end
