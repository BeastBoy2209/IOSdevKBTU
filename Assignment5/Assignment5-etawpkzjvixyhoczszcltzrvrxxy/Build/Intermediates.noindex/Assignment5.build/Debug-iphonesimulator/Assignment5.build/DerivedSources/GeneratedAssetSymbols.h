#import <Foundation/Foundation.h>

#if __has_attribute(swift_private)
#define AC_SWIFT_PRIVATE __attribute__((swift_private))
#else
#define AC_SWIFT_PRIVATE
#endif

/// The "CasinoBackground" asset catalog image resource.
static NSString * const ACImageNameCasinoBackground AC_SWIFT_PRIVATE = @"CasinoBackground";

/// The "LoadingScreen" asset catalog image resource.
static NSString * const ACImageNameLoadingScreen AC_SWIFT_PRIVATE = @"LoadingScreen";

/// The "RouletteWheel" asset catalog image resource.
static NSString * const ACImageNameRouletteWheel AC_SWIFT_PRIVATE = @"RouletteWheel";

/// The "greenBackground" asset catalog image resource.
static NSString * const ACImageNameGreenBackground AC_SWIFT_PRIVATE = @"greenBackground";

#undef AC_SWIFT_PRIVATE
