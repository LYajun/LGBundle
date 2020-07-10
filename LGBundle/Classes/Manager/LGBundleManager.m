//
//  LGBundleManager.m
//  LGBundle
//
//  Created by 刘亚军 on 2020/7/9.
//

#import "LGBundleManager.h"

@interface LGBundleManager ()
@property (nonatomic,strong) NSArray *loadingImgs;
@property (nonatomic,strong) NSBundle *bundle;
@property (nonatomic,strong) NSBundle *barBundle;
@property (nonatomic,strong) NSBundle *audioBundle;
@property (nonatomic,strong) NSBundle *commonBundle;
@end
@implementation LGBundleManager
+ (LGBundleManager *)defaultManager{
    static LGBundleManager * macro = nil;
       static dispatch_once_t onceToken;
       dispatch_once(&onceToken, ^{
           macro = [[LGBundleManager alloc]init];
           [macro configure];
       });
       return macro;
}

- (void)configure{
    _bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:LGBundleManager.class] pathForResource:@"LGBundle" ofType:@"bundle"]];
    _barBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:LGBundleManager.class] pathForResource:@"LGBarBundle" ofType:@"bundle"]];
    _audioBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:LGBundleManager.class] pathForResource:@"LGAudioBundle" ofType:@"bundle"]];
    _commonBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:LGBundleManager.class] pathForResource:@"LGCommonBundle" ofType:@"bundle"]];
    
    [self initLoadingImg];
}

- (void)initLoadingImg{
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    NSFileManager *fielM = [NSFileManager defaultManager];
    NSArray *arrays = [fielM contentsOfDirectoryAtPath:[self loadingDir] error:nil];
    NSMutableArray *imageArr = [NSMutableArray array];
    for (NSInteger i = 1; i <= arrays.count; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"%@/loading%li.jpg",self.loadingDir,i];
        UIImage *image =  [UIImage imageWithContentsOfFile:imagePath];
        if (image) {
            [imageArr addObject:image];
        }
    }
    NSLog(@"loadingGifImg Linked in %f ms", (CFAbsoluteTimeGetCurrent() - startTime) *1000.0);
    self.loadingImgs = imageArr;
}

- (NSString *)emptyDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"Empty"];
}
- (NSString *)errorDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"Error"];
}
- (NSString *)searchEmptyDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"SearchEmpty"];
}
- (NSString *)loadingDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"Loading1"];
}
- (NSString *)pathInBundleWithName:(NSString *)name{
    return [[_bundle resourcePath] stringByAppendingPathComponent:name];
}
- (NSString *)pathInBarBundleWithName:(NSString *)name{
     return [[_barBundle resourcePath] stringByAppendingPathComponent:name];
}
- (NSString *)pathInAudioBundleWithName:(NSString *)name{
     return [[_audioBundle resourcePath] stringByAppendingPathComponent:name];
}
- (NSString *)pathInCommonBundleWithName:(NSString *)name{
     return [[_commonBundle resourcePath] stringByAppendingPathComponent:name];
}
@end
