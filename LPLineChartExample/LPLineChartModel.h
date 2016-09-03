//
//  LPLineChartModel.h
//  LPLineChartExample
//
//  Created by yanglipeng on 16/7/18.
//  Copyright © 2016年 yanglipeng. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LPLineJoinNone = 0,//圆形
    LPLineJoinRound,//圆形
    LPLineJoinSquare,//正方形
    LPLineJoinTriangle,//正三角形
} LPLineJoinStyle;

typedef enum : NSUInteger {
    LPTextSituationNone = 0,
    LPTextSituationTop,
    LPTextSituationBottom,
} LPTextSituation;

@interface LPLineChartModel : NSObject
/**  数据  */
@property (nonatomic, strong) NSArray *valueArray;
/**  折线宽度  */
@property (nonatomic, assign) CGFloat lineWidth;
/**  折线颜色  */
@property (nonatomic, strong) UIColor *lineColor;
/**  折点样式  */
@property (nonatomic, assign) LPLineJoinStyle joinStyle;
/**  折点颜色  */
@property (nonatomic, strong) UIColor *pointColor;
/**  折点宽度（采用折点中心到正上方的距离）  */
@property (nonatomic, assign) CGFloat pointWidth;
/**  折点数组  */
@property (nonatomic, strong) NSArray *pointArray;
/**  上边距  */
@property (nonatomic, assign) CGFloat topPadding;
/**  下边距  */
@property (nonatomic, assign) CGFloat bottomPadding;
/**  左边距  */
@property (nonatomic, assign) CGFloat leftPadding;
/**  右边距  */
@property (nonatomic, assign) CGFloat rightPadding;
/**  边距  */
@property (nonatomic, assign) UIEdgeInsets edge;
/**  文本位置  */
@property (nonatomic, assign) LPTextSituation textSituation;
/**  文本格式  */
@property (nonatomic, strong) NSDictionary *textAttribute;
/**  文本到折点中心的垂直距离  */
@property (nonatomic, assign) CGFloat textPadding;
/**  前缀  */
@property (nonatomic, copy) NSString *prefixString;
/**  后缀  */
@property (nonatomic, copy) NSString *suffixString;

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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;


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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;


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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation;


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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;


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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;


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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge;

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
+(instancetype)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation prefixString:(NSString *)prefixString suffixString:(NSString *)suffixString textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation textPadding:(CGFloat )textPadding textAttribute:(NSDictionary *)textAttribute;

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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge textSituation:(LPTextSituation )textSituation;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth lineColor:(UIColor *)lineColor joinStyle:(LPLineJoinStyle )joinStyle pointColor:(UIColor *) pointColor pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle pointWidth:(CGFloat )pointWidth edge:(UIEdgeInsets )edge;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color joinStyle:(LPLineJoinStyle )joinStyle edge:(UIEdgeInsets )edge;


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
-(void)modelWithValueArray:(NSArray *)valueArray lineWidth:(CGFloat )lineWidth color:(UIColor *)color edge:(UIEdgeInsets )edge;






@end











