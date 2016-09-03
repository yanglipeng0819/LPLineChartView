//
//  LPLineChartModel.m
//  LPLineChartExample
//
//  Created by yanglipeng on 16/7/18.
//  Copyright © 2016年 yanglipeng. All rights reserved.
//

#import "LPLineChartModel.h"

@implementation LPLineChartModel


#pragma mark - 类方法生成折线模型
/**
 *  生成折线模型
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *  @param prefixString  前缀
 *  @param suffixString  后缀
 *  @param textPadding   文本到折点的距离
 *  @param textAttribute 文本格式
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{

    LPLineChartModel *model = [[LPLineChartModel alloc] init];

    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:prefixString suffixString:suffixString textPadding:textPadding textAttribute:textAttribute];
    
    return model;

}


/**
 *  生成折线模型-无前后缀
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *  @param textPadding   文本到折点的距离
 *  @param textAttribute 文本格式
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    
    return model;
}


/**
 *  生成折线模型-无前后缀/无格式/文本到折点10
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:10 textAttribute:nil];
    
    return model;
}


/**
 *  生成折线模型-无前后缀/无格式/无文本
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    return model;
}


/**
 *  生成折线模型-无前后缀/无格式/无文本/同一颜色
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param color     颜色
 *  @param joinStyle     折点类型
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    return model;
}


/**
 *  生成折线模型-无前后缀/无格式/无文本/同一颜色
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度（折点宽度为折线宽度的1.6倍）
 *  @param color         颜色
 *  @param joinStyle     折点类型
 *  @param edge          边距
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    return model;
}

/**
 *  生成折线模型-无前后缀/无格式/无文本/无折点
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param color         颜色
 *  @param edge          边距
 *
 *  @return 模型
 */
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge{
    
    LPLineChartModel *model = [[LPLineChartModel alloc] init];
    
    [model modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:0 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    return model;
}


#pragma mark - 对象方法设置模型属性
/**
 *  设置模型属性
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *  @param prefixString  前缀
 *  @param suffixString  后缀
 *  @param textPadding   文本到折点的距离
 *  @param textAttribute 文本格式
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{

    self.valueArray = valueArray;
    self.lineWidth = lineWidth;
    self.lineColor = lineColor;
    self.joinStyle = joinStyle;
    self.pointColor = pointColor;
    self.pointWidth = pointWidth;
    self.edge = edge;
    self.textSituation = textSituation;
    self.prefixString = prefixString;
    self.suffixString = suffixString;
    self.textPadding = textPadding;
    self.textAttribute = textAttribute;
    
    self.topPadding = edge.top;
    self.bottomPadding = edge.bottom;
    self.rightPadding = edge.right;
    self.leftPadding = edge.left;

}


/**
 *  设置模型属性-无前后缀
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *  @param textPadding   文本到折点的距离
 *  @param textAttribute 文本格式
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute{

    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:textPadding textAttribute:textAttribute];
    

}

/**
 *  设置模型属性-无前后缀/无格式/文本到折点10
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *  @param textSituation 文本位置
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation{
    
    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:textSituation prefixString:nil suffixString:nil textPadding:10 textAttribute:nil];
    
    
}


/**
 *  设置模型属性-无前后缀/无格式/无文本
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param lineColor     折线颜色
 *  @param joinStyle     折点类型
 *  @param pointColor    折点颜色
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:lineColor joinStyle:joinStyle pointColor:pointColor pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
}


/**
 *  设置模型属性-无前后缀/无格式/无文本/同一颜色
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param color     颜色
 *  @param joinStyle     折点类型
 *  @param pointWidth    折点宽度
 *  @param edge          边距
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge{
    
    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:pointWidth edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
}


/**
 *  设置模型属性-无前后缀/无格式/无文本/同一颜色
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度（折点宽度为折线宽度的1.6倍）
 *  @param color         颜色
 *  @param joinStyle     折点类型
 *  @param edge          边距
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge{
    
    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:joinStyle pointColor:color pointWidth:lineWidth * 1.6 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
}


/**
 *  设置模型属性-无前后缀/无格式/无文本/无折点
 *
 *  @param valueArray    数据数组
 *  @param lineWidth     折线宽度
 *  @param color         颜色
 *  @param edge          边距
 *
 *  @return 模型
 */
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge{
    
    [self modelWithValueArray:valueArray lineWidth:lineWidth lineColor:color joinStyle:LPLineJoinNone pointColor:color pointWidth:0 edge:edge textSituation:LPTextSituationNone prefixString:nil suffixString:nil textPadding:0 textAttribute:nil];
    
    
}

@end










