//
//  LPMoreLineChartView.m
//  LPLineChartExample
//
//  Created by yanglipeng on 16/7/18.
//  Copyright © 2016年 yanglipeng. All rights reserved.
//

#import "LPMoreLineChartView.h"

//控件自身宽度 和 高度
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height
//折点的 x 和 y
#define kPointX ((kWidth - model.leftPadding - model.rightPadding) / model.valueArray.count * (0.5 + i) + model.leftPadding)
#define kPointY ((kHeight - model.topPadding - model.bottomPadding) / range * (max - [model.valueArray[i] intValue]) + model.topPadding)

//默认数据
//默认边距
#define kDefaultPadding 20
//默认线宽
#define kDefaultLineWidth 3.0
//默认颜色
#define kDefaultColor [UIColor blackColor]
//默认折点宽度 （采用折点中心到正上方的距离 ）
#define kDefaultpointWidth 5.0
//默认文本到折点中心的距离
#define kDefaultTextPadding 10.0
//默认文本位置 文本在上
#define kDefaultTextSituation LPtextSituationTop
//默认四周边距
#define kDefaultEdge UIEdgeInsetsMake(kDefaultPadding, kDefaultPadding, kDefaultPadding, kDefaultPadding)


typedef enum : NSUInteger {
    kMaxValue = 0,
    kMinValue
} kExtremeValue;

@implementation LPMoreLineChartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setDefaultLineProperty];
    }
    return self;
}

//设置默认属性
- (void)setDefaultLineProperty{
    
    //默认数据 如下
    self.lineChartModel.valueArray = nil;
    //默认线宽 3.0
    self.lineChartModel.lineWidth = kDefaultLineWidth;
    //默认线颜色 黑色
    self.lineChartModel.lineColor = kDefaultColor;
    //默认拐点样式 圆形
    self.lineChartModel.joinStyle = LPLineJoinRound;
    //默认拐点颜色 黑色
    self.lineChartModel.pointColor = kDefaultColor;
    //默认拐点宽度 5.0
    self.lineChartModel.pointWidth = kDefaultpointWidth;
    //默认上间距 20
    self.lineChartModel.topPadding = kDefaultPadding;
    //默认下间距 20
    self.lineChartModel.bottomPadding = kDefaultPadding;
    //默认左间距 20
    self.lineChartModel.leftPadding = kDefaultPadding;
    //默认右间距 20
    self.lineChartModel.rightPadding = kDefaultPadding;
    //默认边距
    self.lineChartModel.edge = kDefaultEdge;
    //文字默认位置 上
    self.lineChartModel.textSituation = LPTextSituationTop;
    //默认文字距离拐点的垂直距离 20
    self.lineChartModel.textPadding = kDefaultTextPadding;
    //默认前缀 空
    self.lineChartModel.prefixString = @"";
    //默认后缀 空
    self.lineChartModel.suffixString = @"";
    //默认格式
    self.lineChartModel.textAttribute = @{
                                               NSForegroundColorAttributeName:[UIColor whiteColor]
                                               };

}

-(void)drawRect:(CGRect)rect{
    
    int max = [self findExtremeValueWithLineChartModelArray:self.lineChartModelArray andExtremeValue:kMaxValue];
    int min = [self findExtremeValueWithLineChartModelArray:self.lineChartModelArray andExtremeValue:kMinValue];
    
    for (int i = 0 ; i < self.lineChartModelArray.count; i++) {
        [self drawLineWithModel:self.lineChartModelArray[i] andRang:max andmin:min];
        
        [self drawTextWithModel:self.lineChartModelArray[i]];
    }
    
    
}
//设置最大值和最小值
- (int)findExtremeValueWithLineChartModelArray:(NSArray *)lineChartModelArray andExtremeValue:(kExtremeValue )extremeValue{
    
    if (extremeValue == 0) {//求所有数据中的最大值
        int oldMax = 0;
        for (int i = 0 ; i < self.lineChartModelArray.count; i++) {
            int newMax = [[self.lineChartModelArray[i].valueArray valueForKeyPath:@"@max.intValue"] intValue];
            
            if (i == 0) {//设置第一个值
                oldMax = newMax;
            }else{
                if (newMax > oldMax) {//对比 如果新值大于旧值  则把新值赋值给旧值 求得最大值
                    oldMax = newMax;
                }
            }
            
        }
        return oldMax;//返回最大值
    }else{                  //求所有数据中的最小值
        int oldMin = 0;
        for (int i = 0 ; i < self.lineChartModelArray.count; i++) {
            int newMin = [[self.lineChartModelArray[i].valueArray valueForKeyPath:@"@min.intValue"] intValue];
            
            if (i == 0) {//设置第一个值
                oldMin = newMin;
            }else{
                
                if (newMin < oldMin) {//对比 如果新值小于旧值  则把新值赋值给旧值 求得最小值
                    oldMin = newMin;
                }
            }
            
        }
        return oldMin;//返回最小值
    }
    return 0;
    
}

/**
 *  画折线
 *
 *  @param model 折线模型
 *  @param max   所有数据的最大值
 *  @param min   所有数据的最小值
 */
- (void)drawLineWithModel:(LPLineChartModel *)model andRang:(int )max andmin:(int )min{
    
//    NSLog(@"xx");
    int range = max - min;
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    
    [model.lineColor set]; //设置折线颜色
    linePath.lineWidth = model.lineWidth;//设置线宽
    linePath.lineJoinStyle = kCGLineJoinRound;
    
    CGPoint point;//定义一个起点
    NSMutableArray *pointArrM = [NSMutableArray array];
    
    for (int i = 0 ; i < model.valueArray.count; i++) {
        
        point = CGPointMake(kPointX, kPointY);
        
        if (i == 0) {
            
            [linePath moveToPoint:point];
            
        }else{
            
            [linePath addLineToPoint:point];
            
            if (i == model.valueArray.count - 1) {
                
                [linePath stroke];
            }
        }
        
        [pointArrM addObject:[NSValue valueWithCGPoint:point]];
        
    }
    model.pointArray = pointArrM.copy;
    
    [model.pointColor set];
    for (int i = 0 ; i < model.valueArray.count; i++) {
        
        CGPoint point = [model.pointArray[i] CGPointValue];
        UIBezierPath *pointPath;
        if (model.joinStyle == LPLineJoinRound) {
            //画小圆点
            pointPath = [UIBezierPath bezierPathWithArcCenter:point radius:model.pointWidth startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        }else if(model.joinStyle == LPLineJoinSquare){

            pointPath = [UIBezierPath bezierPathWithRect:CGRectMake(point.x - model.pointWidth, point.y - model.pointWidth, model.pointWidth * 2, model.pointWidth * 2)];
            
        }else if(model.joinStyle == LPLineJoinNone){
            
            
        }else{
            pointPath = [UIBezierPath bezierPath];
            [pointPath moveToPoint:CGPointMake(point.x, point.y - model.pointWidth)];
            [pointPath addLineToPoint:CGPointMake(point.x + model.pointWidth * 0.5 * sqrt(3), point.y + model.pointWidth * 0.5)];
            
            [pointPath addLineToPoint:CGPointMake(point.x - model.pointWidth * 0.5 * sqrt(3), point.y + model.pointWidth * 0.5)];
            [pointPath closePath];
        }
        
        [pointPath fill];
        
    }
    
    
}

/**
 *  画文本
 *  @param valueArray 数据数组
 *  @param attribute  文本格式
 */
- (void)drawTextWithModel:(LPLineChartModel *)model{
    
    if (model.textSituation != LPTextSituationNone) {
        
        
        for (int i = 0 ; i < model.valueArray.count; i++) {
            
            NSMutableString *str = [NSMutableString string];
            //拼接前后缀
            if (model.prefixString) {
                [str appendString:model.prefixString];
            }
            
            [str appendString:[NSString stringWithFormat:@"%@",model.valueArray[i]]];
            
            if (model.suffixString) {
                [str appendString:model.suffixString];
            }
            
            //最终文本
            NSString *string = str.copy;
            //计算文本size
            CGSize stringSize =[string sizeWithAttributes:model.textAttribute];
            //取折点
            CGPoint point = [model.pointArray[i] CGPointValue];
            
            //画文字
            if (model.textSituation == LPTextSituationTop) {//文字在上
                CGPoint textPointTop = CGPointMake(point.x - stringSize.width / 2, point.y - stringSize.height - model.textPadding);
                
                [string drawAtPoint:textPointTop withAttributes:model.textAttribute];
                
                
            }else{//文字在下
                
                CGPoint textPointBottom = CGPointMake(point.x - stringSize.width / 2, point.y + model.textPadding);
                
                [string drawAtPoint:textPointBottom withAttributes:model.textAttribute];
            }
        }
    }
}

#pragma mark - 类方法生成一条折线
+(instancetype)drawLineViewWith:(LPLineChartModel *)lineChartModel{
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];

    view.lineChartModelArray = @[lineChartModel];
    
    return view;
}


+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{

    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:prefixString suffixString:suffixString textPadding:textPadding textAttribute:textAttribute];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:lineWidth * 1.6 edge:UIEdgeInsetsMake(0, 0, 0, 0) textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model];
    
    return view;
}

#pragma mark - 对象方法设置一条折线属性

- (void)drawLineViewWith:(LPLineChartModel *)lineChartModel{

    self.lineChartModelArray = @[lineChartModel];

}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{

    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:prefixString suffixString:suffixString textPadding:textPadding textAttribute:textAttribute];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    self.lineChartModelArray = @[model];
}

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color{
    
    LPLineChartModel *model = [LPLineChartModel modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:lineWidth * 1.6 edge:UIEdgeInsetsMake(0, 0, 0, 0) textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    self.lineChartModelArray = @[model];
}

#pragma mark - 类方法生成多条折线

+(instancetype)drawTwoLineViewLineChartModel:(LPLineChartModel *)lineChartModel andAnotherLineChartModel:(LPLineChartModel *)anotherLineChartModel{
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[lineChartModel,anotherLineChartModel];
    
    
    return view;
    
}

+(instancetype)drawMoreLineViewWith:(NSArray<LPLineChartModel *> *)lineChartModelArray{
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = lineChartModelArray;
    
    return view;
}


/**
 *  生成双折线
 *
 *  @param valueArray1    折线1的数据数组
 *  @param valueArray2    折线2的数据数组
 *  @param lineWidth      线宽
 *  @param lineColor1     折线1的颜色
 *  @param lineColor2     折线2的颜色
 *  @param joinStyle1     折线1的折点样式
 *  @param joinStyle2     折线2的折点样式
 *  @param pointWidth     折点宽度
 *  @param edge           间距
 *  @param textSituation1 折线1文本位置
 *  @param textSituation2 折线2文本位置
 *  @param textPadding    文本到折点的距离
 *  @param textAttribute  文本格式
 */
+(instancetype)drawTwoLineWithValueArray1:(NSArray *)valueArray1 valueArray2:(NSArray *)valueArray2 lineWidth:(CGFloat )lineWidth lineColor1:(UIColor *)lineColor1 lineColor2:(UIColor *)lineColor2 joinStyle1:(LPLineJoinStyle )joinStyle1 joinStyle2:(LPLineJoinStyle )joinStyle2 pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation1:(LPTextSituation )textSituation1 textSituation2:(LPTextSituation )textSituation2 textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{
    
    LPLineChartModel *model1 = [LPLineChartModel modelWithValueArray:valueArray1 lineWidth:lineWidth lineColor:lineColor1 joinStyle:joinStyle1 pointColor:lineColor1 pointWidth:pointWidth edge:edge textSituation:textSituation1 prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    LPLineChartModel *model2 = [LPLineChartModel modelWithValueArray:valueArray2 lineWidth:lineWidth lineColor:lineColor2 joinStyle:joinStyle2 pointColor:lineColor2 pointWidth:pointWidth edge:edge textSituation:textSituation2 prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    LPMoreLineChartView *view = [[LPMoreLineChartView alloc] init];
    
    view.lineChartModelArray = @[model1,model2];
    
    return view;
}
#pragma mark - 对象方法设置多条折线属性


-(void)drawTwoLineViewLineChartModel:(LPLineChartModel *)lineChartModel andAnotherLineChartModel:(LPLineChartModel *)anotherLineChartModel{
    
    
    self.lineChartModelArray = @[lineChartModel,anotherLineChartModel];
    
    
    
}

-(void)drawMoreLineViewWith:(NSArray<LPLineChartModel *> *)lineChartModelArray{
    
    
    self.lineChartModelArray = lineChartModelArray;
    
    
}

/**
 *  双折线的属性设置
 *
 *  @param valueArray1    折线1的数据数组
 *  @param valueArray2    折线2的数据数组
 *  @param lineWidth      线宽
 *  @param lineColor1     折线1的颜色
 *  @param lineColor2     折线2的颜色
 *  @param joinStyle1     折线1的折点样式
 *  @param joinStyle2     折线2的折点样式
 *  @param pointWidth     折点宽度
 *  @param edge           间距
 *  @param textSituation1 折线1文本位置
 *  @param textSituation2 折线2文本位置
 *  @param textPadding    文本到折点的距离
 *  @param textAttribute  文本格式
 */
- (void)drawTwoLineWithValueArray1:(NSArray *)valueArray1 valueArray2:(NSArray *)valueArray2 lineWidth:(CGFloat )lineWidth lineColor1:(UIColor *)lineColor1 lineColor2:(UIColor *)lineColor2 joinStyle1:(LPLineJoinStyle )joinStyle1 joinStyle2:(LPLineJoinStyle )joinStyle2 pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation1:(LPTextSituation )textSituation1 textSituation2:(LPTextSituation )textSituation2 textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{
    
    LPLineChartModel *model1 = [LPLineChartModel modelWithValueArray:valueArray1 lineWidth:lineWidth lineColor:lineColor1 joinStyle:joinStyle1 pointColor:lineColor1 pointWidth:pointWidth edge:edge textSituation:textSituation1 prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    LPLineChartModel *model2 = [LPLineChartModel modelWithValueArray:valueArray2 lineWidth:lineWidth lineColor:lineColor2 joinStyle:joinStyle2 pointColor:lineColor2 pointWidth:pointWidth edge:edge textSituation:textSituation2 prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    
    self.lineChartModelArray = @[model1,model2];
}



@end
