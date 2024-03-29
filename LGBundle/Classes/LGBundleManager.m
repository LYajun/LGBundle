//
//  LGBundleManager.m
//
//  Created by 刘亚军 on 2020/7/9.
//

#import "LGBundleManager.h"

@interface LGBundleManager ()
@property (nonatomic,strong) NSArray *loadingImgs;
@property (nonatomic,strong) NSBundle *bundle;

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
    _loadingGifWidth = IsIPad ? 140 : 100;
    _bundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:LGBundleManager.class] pathForResource:@"Bundle" ofType:@"bundle"]];
  
    
    [self initLoadingImg];
}
- (NSBundle *)barBundle{
    return _bundle;
}
- (void)initLoadingImg{
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    NSFileManager *fielM = [NSFileManager defaultManager];
    NSArray *arrays = [fielM contentsOfDirectoryAtPath:[self loadingDir] error:nil];
    NSMutableArray *imageArr = [NSMutableArray array];
    for (NSInteger i = 1; i <= arrays.count; i++) {
        NSString *imagePath = [NSString stringWithFormat:@"%@/loading%li.png",self.loadingDir,i];
        UIImage *image =  [UIImage imageWithContentsOfFile:imagePath];
        if (image) {
            [imageArr addObject:image];
        }
    }
    NSLog(@"loadingGifImg Linked in %f ms", (CFAbsoluteTimeGetCurrent() - startTime) *1000.0);
    self.loadingImgs = imageArr;
}

- (NSString *)emptyDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"empty"];
}
- (NSString *)errorDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"error"];
}
- (NSString *)searchEmptyDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"search_empty"];
}
- (NSString *)loadingDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"loading1"];
}

- (NSString *)navbarBgDir{
    return [[_bundle resourcePath] stringByAppendingPathComponent:@"navbar_bg"];
}

- (NSString *)pathInBundleWithName:(NSString *)name{
    return [[_bundle resourcePath] stringByAppendingPathComponent:name];
}
- (NSString *)pathInBarBundleWithName:(NSString *)name{
     return [[_bundle resourcePath] stringByAppendingPathComponent:name];
}

@end
