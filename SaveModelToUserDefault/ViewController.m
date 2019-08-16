//
//  ViewController.m
//  SaveModelToUserDefault
//
//  Created by mtaxi on 2019/8/16.
//  Copyright © 2019 leo. All rights reserved.
//

#import "ViewController.h"
#import "FavPlaceModel.h"

@interface ViewController ()

@property(nonatomic, strong) FavPlaceModel *addrModel;

@end

@implementation ViewController
#pragma mark - Init
-(void)initDatas {
	//初值化
	self.addrModel = [[FavPlaceModel alloc]initWithName:@"麥當勞" address:@"忠孝東路走九遍"];
}

#pragma mark - Life cycel
- (void)viewDidLoad {
	[super viewDidLoad];
	[self initDatas];
	[self archivedDataWithRootObject:self.addrModel];
	[self unarchiveObjectWithData];
}

#pragma mark - Translate model method
-(void)archivedDataWithRootObject:(FavPlaceModel*)model {
	//編碼
	NSData *favAddressData = [NSKeyedArchiver archivedDataWithRootObject:model];
	
	//存入
	[[NSUserDefaults standardUserDefaults] setObject:favAddressData forKey:@"favAddress"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	
	NSLog(@"儲存完成");
}

-(void)unarchiveObjectWithData {
	//讀取
	NSData *favAddrData =[[NSUserDefaults standardUserDefaults] objectForKey:@"favAddress"];
	
	//解碼
	FavPlaceModel *favAddrModel = [NSKeyedUnarchiver unarchiveObjectWithData:favAddrData];
	
	NSLog(@"名稱：%@ 地址：%@",favAddrModel.name,favAddrModel.address);
}


@end
