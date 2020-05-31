#include "RCCSRootListController.h"

@implementation RCCSRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}
- (void) respring() {
	[HBRespringController respring]
}
@end
