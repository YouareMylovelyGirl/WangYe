//
//  YGPicPhotoController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicPhotoController.h"

@interface YGPicPhotoController ()<MWPhotoBrowserDelegate>
/** 图片数组 */
@property(nonatomic, strong) NSMutableArray<MWPhoto> *picArr;

@end

@implementation YGPicPhotoController

#pragma mark - 构造方法
- (instancetype)initWithPicAllItem:(NSArray *)picAllArr index:(NSInteger)index
{
    if (self = [super initWithDelegate:self]) {
        self.picAllArr = picAllArr;
        self.index = index;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    for (NSString *url in self.picAllArr) {
        MWPhoto *photo = [MWPhoto photoWithURL:url.yg_URL];
        [self.picArr addObject:photo];
    }

    self.displayNavArrows = YES;//左右分页切换,默认否
    
    //刷新当前界面
    [self reloadData];
    //设置选中当前照片
    [self setCurrentPhotoIndex:self.index];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser
{
    return self.picArr.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index
{
    return self.picArr[index];
}




#pragma mark - lazy
- (NSMutableArray<MWPhoto> *)picArr {
	if(_picArr == nil) {
		_picArr = [[NSMutableArray<MWPhoto> alloc] init];
	}
	return _picArr;
}

@end
