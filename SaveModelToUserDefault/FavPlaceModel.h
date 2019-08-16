#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//加入NSCoding的protocal是因為NSUserDefault不支援存入自定義類別，
//但支援NSData，所以要將自定義類別進行編碼
@interface FavPlaceModel : NSObject<NSCoding>

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *address;

- (instancetype)initWithName:(NSString*)name address:(NSString*)address;


@end

