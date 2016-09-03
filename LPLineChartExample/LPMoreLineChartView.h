//
//  LPMoreLineChartView.h
//  LPLineChartExample
//
//  Created by yanglipeng on 16/7/18.
//  Copyright © 2016年 yanglipeng. All rights reserved.


#import <UIKit/UIKit.h>
#import "LPLineChartModel.h"


@interface LPMoreLineChartView : UIView

@property (nonatomic, strong) LPLineChartModel *lineChartModel;
@property (nonatomic, strong) NSArray<LPLineChartModel *> *lineChartModelArray;

#pragma mark - 类方法生成一条折线
+(instancetype)drawLineViewWith:(LPLineChartModel *)lineChartModel;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge;

+ (instancetype)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color;


#pragma mark - 对象方法设置一条折线属性
- (void)drawLineViewWith:(LPLineChartModel *)lineChartModel;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge;

- (void)drawLineWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color;


#pragma mark - 类方法生成两条折线
+(instancetype)drawTwoLineViewLineChartModel:(LPLineChartModel *)lineChartModel andAnotherLineChartModel:(LPLineChartModel *)anotherLineChartModel;

#pragma mark - 类方法生成多条折线
+(instancetype)drawMoreLineViewWith:(NSArray<LPLineChartModel *> *)lineChartModelArray;

+(instancetype)drawTwoLineWithValueArray1:(NSArray *)valueArray1 valueArray2:(NSArray *)valueArray2 lineWidth:(CGFloat )lineWidth lineColor1:(UIColor *)lineColor1 lineColor2:(UIColor *)lineColor2 joinStyle1:(LPLineJoinStyle )joinStyle1 joinStyle2:(LPLineJoinStyle )joinStyle2 pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation1:(LPTextSituation )textSituation1 textSituation2:(LPTextSituation )textSituation2 textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;


@end
