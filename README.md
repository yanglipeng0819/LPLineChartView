# LPLineChartView
easy to draw a line chart.简单生成折线图
## OneLineChartView
### use all parameter
parameter

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
     
  code 
  
	LPMoreLineChartView *view = [LPMoreLineChartView drawLineWithValueArray:@[@22,@21,@24,@20,@26,@20,@23,@22,@21,@24,@20] lineWidth:3.0 lineColor:[UIColor orangeColor] joinStyle:LPLineJoinRound pointColor:[UIColor redColor] pointWidth:5.0 edge:UIEdgeInsetsMake(40, 30, 40, 30) textSituation:LPTextSituationTop prefixString:@"今天" suffixString:@"℃" textPadding:10 textAttribute:@{NSForegroundColorAttributeName:[UIColor blueColor],NSFontAttributeName:[UIFont systemFontOfSize:(10)]}];
    
    view.frame  = CGRectMake(0, 20, self.view.frame.size.width, 150);
    view.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view];
    
### use less parameter
code

	[view2 drawLineWithValueArray:@[@22,@21,@24,@20,@28,@22,@21,@25,@24,@26] lineWidth:3.0 color:[UIColor blueColor]];
	
## twoLineChartView

code

	LPMoreLineChartView *view3 = [LPMoreLineChartView drawTwoLineWithValueArray1:@[@28,@21,@24,@20,@26,@24,@20,@23,@22,@21,@24,@20] valueArray2:@[@22,@23,@22,@21,@26,@24,@24,@20,@26,@24,@24,@18] lineWidth:3.0 lineColor1:[UIColor orangeColor] lineColor2:[UIColor purpleColor] joinStyle1:LPLineJoinTriangle joinStyle2:LPLineJoinRound pointWidth:5.0 edge:UIEdgeInsetsMake(20, 20, 20, 20) textSituation1:LPTextSituationTop textSituation2:LPTextSituationBottom textPadding:10 textAttribute:nil];
    
    view3.frame  = CGRectMake(0, 340, self.view.frame.size.width, 150);
    view3.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view3];

## moreLineChartView
code

	LPLineChartModel *model1 = [LPLineChartModel modelWithValueArray:@[@28,@21,@24,@20,@26,@22,@21,@24,@26] lineWidth:3.0 lineColor:[UIColor redColor] joinStyle:LPLineJoinSquare pointColor:[UIColor blueColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 30, 20) textSituation:LPTextSituationTop prefixString:@"" suffixString:@"℃" textPadding:5 textAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPLineChartModel *model2 = [LPLineChartModel modelWithValueArray:@[@22,@23,@22,@21,@20,@26,@24,@24,@16] lineWidth:3.0 lineColor:[UIColor purpleColor] joinStyle:LPLineJoinTriangle pointColor:[UIColor orangeColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 40, 20) textSituation:LPTextSituationBottom prefixString:@"test" suffixString:@"" textPadding:10 textAttribute:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPLineChartModel *model3 = [LPLineChartModel modelWithValueArray:@[@22,@23,@24,@20,@27,@26,@29,@24,@20] lineWidth:3.0 lineColor:[UIColor yellowColor] joinStyle:LPLineJoinNone pointColor:[UIColor brownColor] pointWidth:5.0 edge:UIEdgeInsetsMake(30, 20, 30, 20) textSituation:LPTextSituationBottom prefixString:@"a" suffixString:@"b" textPadding:20 textAttribute:@{NSForegroundColorAttributeName:[UIColor magentaColor],NSFontAttributeName:[UIFont systemFontOfSize:9]}];
    
    LPMoreLineChartView *view4 = [LPMoreLineChartView drawMoreLineViewWith:@[model1,model2,model3]];
    
    view4.frame  = CGRectMake(0, 500, self.view.frame.size.width, 150);
    view4.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview: view4];