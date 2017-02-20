//
//  YGAllDetailPhotoBrowerController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllDetailPhotoBrowerController.h"

@interface YGAllDetailPhotoBrowerController ()<MWPhotoBrowserDelegate>
/** 图片 */
@property(nonatomic, strong) MWPhoto *photo;

@end

@implementation YGAllDetailPhotoBrowerController

#pragma mark - 构造方法
- (instancetype)initWithImgUrl:(NSString *)imgUrl desLB:(NSString *)desLB
{
    self = [super initWithDelegate:self];
    if (self) {
        self.imgUrl = imgUrl;
        self.desLB = desLB;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photo = [MWPhoto photoWithURL:self.imgUrl.yg_URL];
    //图片的详细解释
    self.photo.caption = self.desLB;
    [self reloadData];
}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return 1;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    return self.photo;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
