//
//  ViewController.m
//  TestLayer
//
//  Created by Coody on 2016/6/30.
//  Copyright © 2016年 Coody. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , strong) CALayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *mikuImage = [UIImage imageNamed:@"miku.png"];
    UIImage *smallMiku = [UIImage imageNamed:@"smallMiku.png"];
    UIImage *color = [UIImage imageNamed:@"color.png"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:color];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.center = self.view.center;
    [self.view addSubview:imageView];
    
    
    /*
     
     1. zPosition
        直接設定， layer 會繪製的時候重新排列好
     */
    
    
    
    
    
    
    
    /*
     
     2. contents
        包袱？使用 __briege id 解決
        
     */
    
    
    
    
    
    /*
     
     3. contentsGravity
        類似 UIView 的 contentMode 
        
     */
    
    
    
    
    
    
    /*
     
     4. contentsScale
        scale = 1 （非 retina ）
        scale = 2 （ retina ）
        目前的 scale:
        [UIScreen mainScreen].scale;
     */
    
    
    
    
    
    /*
     
     5. contentsRect
        值： CGRectMake( 0 , 0 , 1.0 , 1.0 );
     
     */
    
    
    
    
    
    /*
     
     6. masksToBounds
        遮罩
        注意： frame , contentsGravity , contentsScale
     
     _maskLayer = [CALayer layer];
     _maskLayer.frame = CGRectMake(0, 0, mikuImage.size.width, mikuImage.size.height);
     _maskLayer.contentsGravity = kCAGravityResizeAspect;
     _maskLayer.contentsScale = [UIScreen mainScreen].scale;
     _maskLayer.contents = (__bridge id)mikuImage.CGImage;
     imageView.layer.mask = _maskLayer;
     
     [self performSelector:@selector(zoneOut) withObject:nil afterDelay:1.0f];
     [self performSelector:@selector(end) withObject:nil afterDelay:10.0f];
     
     */
    _maskLayer = [CALayer layer];
    _maskLayer.frame = CGRectMake(0, 0, mikuImage.size.width, mikuImage.size.height);
    
    
    /*
     
     7. cornerRadius
        邊緣圓弧
     
     */
    
    
    
}

-(void)zoneOut{
    
    static float opacity;
    
    [_maskLayer setFrame:CGRectMake(_maskLayer.frame.origin.x - _maskLayer.frame.size.width*0.005,
                                    _maskLayer.frame.origin.y - _maskLayer.frame.size.height*0.005,
                                    _maskLayer.frame.size.width*1.01,
                                    _maskLayer.frame.size.height*1.01)];
    opacity = _maskLayer.opacity - 0.01;
    [_maskLayer setOpacity:opacity];
    
    [self performSelector:@selector(zoneOut) withObject:nil afterDelay:0.01f];
}

-(void)end{
    [[self class] cancelPreviousPerformRequestsWithTarget:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
