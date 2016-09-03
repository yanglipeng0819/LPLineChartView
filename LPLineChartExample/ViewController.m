//
//  ViewController.m
//  LPLineChartExample
//
//  Created by yanglipeng on 16/7/17.
//  Copyright © 2016年 yanglipeng. All rights reserved.
//

#import "ViewController.h"
#import "LPMoreLineChartView.h"
#import "LPLineChartModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //单条折线
    [self singleLine];
    
    //两条折线
    [self doubleLine];
    
    //多条折线
    [self moreLine];
    
}
//多折线
- (void)moreLine{
    
    LPLineChartModel *model1 = [LPLineChartModel modelWithValueArray:@[@28,@21,@24,@20,@26,@22,@21,@24,@26] lineWidth:3.0 lineColor:[UIColor redColor] joinStyle:LPLineJoinSquare pointColor:[UIColor blueColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 30, 20) textSituation:LPTextSituationTop prefixString:@"" suffixString:@"℃" textPadding:5 textAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPLineChartModel *model2 = [LPLineChartModel modelWithValueArray:@[@22,@23,@22,@21,@20,@26,@24,@24,@16] lineWidth:3.0 lineColor:[UIColor purpleColor] joinStyle:LPLineJoinTriangle pointColor:[UIColor orangeColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 40, 20) textSituation:LPTextSituationBottom prefixString:@"test" suffixString:@"" textPadding:10 textAttribute:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPLineChartModel *model3 = [LPLineChartModel modelWithValueArray:@[@22,@23,@24,@20,@27,@26,@29,@24,@20] lineWidth:3.0 lineColor:[UIColor yellowColor] joinStyle:LPLineJoinNone pointColor:[UIColor brownColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 30, 20) textSituation:LPTextSituationBottom prefixString:@"a" suffixString:@"b" textPadding:20 textAttribute:@{NSForegroundColorAttributeName:[UIColor magentaColor],NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPMoreLineChartView *view3 = [LPMoreLineChartView drawMoreLineViewWith:@[model1,model2,model3]];
    
    view3.frame  = CGRectMake(0, 500, self.view.frame.size.width, 150);
    view3.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view3];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [view3 addSubview:label3];
    label3.text = @"多折线示例";
    
}


//双折线
- (void)doubleLine{

    
    LPMoreLineChartView *view3 = [LPMoreLineChartView drawTwoLineWithValueArray1:@[@28,@21,@24,@20,@26,@24,@20,@23,@22,@21,@24,@20] valueArray2:@[@22,@23,@22,@21,@26,@24,@24,@20,@26,@24,@24,@18] lineWidth:3.0 lineColor1:[UIColor orangeColor] lineColor2:[UIColor purpleColor] joinStyle1:LPLineJoinTriangle joinStyle2:LPLineJoinRound pointWidth:5.0 edge:UIEdgeInsetsMake(20, 20, 20, 20) textSituation1:LPTextSituationTop textSituation2:LPTextSituationBottom textPadding:10 textAttribute:nil];
    
    view3.frame  = CGRectMake(0, 340, self.view.frame.size.width, 150);
    view3.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view3];
    
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [view3 addSubview:label3];
    label3.text = @"双折线示例";
    
}


//单折线
- (void)singleLine{
    
    //参数最多的方法
    /**
     *  画折线
     *
     *  @param valueArray         数据数组
     *  @param lineWidth          折线宽度
     *  @param lineColor          折线颜色
     *  @param joinStyle          折点类型
     *  @param linepointColor     折点颜色
     *  @param linepointWidth     折点宽度
     *  @param topPadding         顶部间距
     *  @param rightPadding       右间距
     *  @param bottomPadding      底部间距
     *  @param leftPadding        左边距
     *  @param textSituation      文本位置
     *  @param prefixString       文本前缀
     *  @param suffixString       文本后缀
     *  @param valueStringPadding 文本与折点的垂直距离
     *  @param textAttribute      文本格式
     */
    LPMoreLineChartView *view = [LPMoreLineChartView drawLineWithValueArray:@[@22,@21,@24,@20,@26,@20,@23,@22,@21,@24,@20] lineWidth:3.0 lineColor:[UIColor orangeColor] joinStyle:LPLineJoinRound pointColor:[UIColor redColor] pointWidth:5.0 edge:UIEdgeInsetsMake(40, 30, 40, 30) textSituation:LPTextSituationTop prefixString:@"今天" suffixString:@"℃" textPadding:10 textAttribute:@{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:[UIFont systemFontOfSize:(10)]}];
    
    view.frame  = CGRectMake(0, 20, self.view.frame.size.width, 150);
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [view addSubview:label];
    label.text = @"复杂单折线示例";
    
    
    
    
    LPMoreLineChartView *view2 = [[LPMoreLineChartView alloc] init];
    
    view2.frame  = CGRectMake(0, 180, self.view.frame.size.width, 150);
    view2.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view2];
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 20)];
    [view2 addSubview:label2];
    label2.text = @"简单单折线示例";

    //参数最少的方法
    /**
     *  画折线
     *
     *  @param valueArray         数据数组
     *  @param lineWidth          折线宽度 （折点宽度为折线宽度的1.6倍）
     *  @param color          折线颜色
     */
    [view2 drawLineWithValueArray:@[@22,@21,@24,@20,@28,@22,@21,@25,@24,@26] lineWidth:3.0 color:[UIColor blueColor]];
}
@end
