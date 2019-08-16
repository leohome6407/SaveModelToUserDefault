#import "FavPlaceModel.h"

@implementation FavPlaceModel
//加入NSCoding的protocal必須實作下列兩種方法
- (instancetype)initWithName:(NSString*)name address:(NSString*)address {
    self = [super init];
    if (self) {
        self.name = name;
        self.address = address;
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder*)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.address forKey:@"address"];
}

-(instancetype)initWithCoder:(NSCoder*)aDecoder {
    if(self = [super init]){
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.address = [aDecoder decodeObjectForKey:@"address"];
    }
    return self;
}

@end
