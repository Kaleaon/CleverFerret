.class public Lcom/flyersoft/views/BookCalendar/CalendarGridView;
.super Landroid/view/ViewGroup;
.source "CalendarGridView.java"


# static fields
.field private static final FLOAT_FUDGE:F = 0.5f


# instance fields
.field private final dividerPaint:Landroid/graphics/Paint;

.field private oldNumRows:I

.field private oldWidthMeasureSize:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->dividerPaint:Landroid/graphics/Paint;

    const/4 p2, 0x0

    .line 33
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    .line 79
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 80
    move-object v0, p1

    check-cast v0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setIsHeaderRow(Z)V

    .line 82
    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 16

    move-object/from16 v0, p0

    .line 86
    invoke-super/range {p0 .. p1}, Landroid/view/ViewGroup;->dispatchDraw(Landroid/graphics/Canvas;)V

    const/4 v1, 0x1

    .line 87
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    .line 88
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getTop()I

    move-result v2

    .line 89
    invoke-virtual {v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getBottom()I

    move-result v3

    const/4 v4, 0x0

    .line 91
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v5

    invoke-virtual {v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getLeft()I

    move-result v6

    add-int/2addr v5, v6

    int-to-float v6, v5

    const/high16 v7, 0x3f000000    # 0.5f

    add-float v9, v6, v7

    int-to-float v10, v2

    int-to-float v14, v3

    .line 92
    iget-object v13, v0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->dividerPaint:Landroid/graphics/Paint;

    move v11, v9

    move-object/from16 v8, p1

    move v12, v14

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    :goto_0
    const/4 v2, 0x7

    if-ge v4, v2, :cond_0

    .line 96
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getRight()I

    move-result v2

    add-int/2addr v2, v5

    int-to-float v2, v2

    sub-float v11, v2, v7

    .line 97
    iget-object v15, v0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->dividerPaint:Landroid/graphics/Paint;

    move v13, v11

    move v12, v10

    move-object/from16 v10, p1

    invoke-virtual/range {v10 .. v15}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    move v10, v12

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 7

    .line 102
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p3

    .line 104
    invoke-virtual {p2}, Landroid/view/View;->getBottom()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    .line 105
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v2, v0

    int-to-float v3, p4

    invoke-virtual {p2}, Landroid/view/View;->getRight()I

    move-result p2

    add-int/lit8 p2, p2, -0x2

    int-to-float v4, p2

    iget-object v6, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->dividerPaint:Landroid/graphics/Paint;

    move v5, v3

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return p3
.end method

.method protected onLayout(ZIIII)V
    .locals 5

    .line 145
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 147
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result p1

    const/4 p3, 0x0

    const/4 p5, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge p5, p1, :cond_0

    .line 148
    invoke-virtual {p0, p5}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 149
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v4, v2

    .line 150
    invoke-virtual {v3, p2, v2, p4, v4}, Landroid/view/View;->layout(IIII)V

    add-int/lit8 p5, p5, 0x1

    move v2, v4

    goto :goto_0

    .line 153
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    sub-long/2addr p1, v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, p3

    const-string p1, "Grid.onLayout %d ms"

    invoke-static {p1, p2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 13

    .line 110
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    move-result-object v0

    .line 111
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->toString(I)Ljava/lang/String;

    move-result-object p2

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object p2, v2, v0

    .line 110
    const-string p2, "Grid.onMeasure w=%s h=%s"

    invoke-static {p2, v2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 112
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 113
    iget p2, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->oldWidthMeasureSize:I

    if-ne p2, p1, :cond_0

    .line 114
    const-string p1, "SKIP Grid.onMeasure"

    invoke-static {p1}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;)V

    .line 115
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setMeasuredDimension(II)V

    return-void

    .line 118
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    .line 119
    iput p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->oldWidthMeasureSize:I

    .line 120
    div-int/lit8 p1, p1, 0x7

    mul-int/lit8 p2, p1, 0x7

    const/high16 v2, 0x40000000    # 2.0f

    .line 124
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    const/high16 v6, -0x80000000

    .line 126
    invoke-static {p2, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 127
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_0
    if-ge v9, v8, :cond_3

    .line 128
    invoke-virtual {p0, v9}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v11

    .line 129
    invoke-virtual {v11, p1}, Landroid/view/View;->setMinimumHeight(I)V

    .line 130
    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v12

    if-nez v12, :cond_2

    if-nez v9, :cond_1

    .line 132
    invoke-static {p1, v6}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v12

    invoke-virtual {p0, v11, v2, v12}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->measureChild(Landroid/view/View;II)V

    goto :goto_1

    .line 134
    :cond_1
    invoke-virtual {p0, v11, v2, v7}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->measureChild(Landroid/view/View;II)V

    .line 136
    :goto_1
    invoke-virtual {v11}, Landroid/view/View;->getMeasuredHeight()I

    move-result v11

    add-int/2addr v10, v11

    :cond_2
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_3
    add-int/2addr p2, v1

    .line 140
    invoke-virtual {p0, p2, v10}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setMeasuredDimension(II)V

    .line 141
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    sub-long/2addr p1, v4

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    new-array p2, v0, [Ljava/lang/Object;

    aput-object p1, p2, v3

    const-string p1, "Grid.onMeasure %d ms"

    invoke-static {p1, p2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public setDayBackground(II)V
    .locals 2

    const/4 v0, 0x1

    .line 47
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 48
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    invoke-virtual {v1, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setCellBackground(II)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setDayTextColor(I)V
    .locals 2

    const/4 v0, 0x0

    .line 53
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 60
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    invoke-virtual {v1, p1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setCellTextColor(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V
    .locals 2

    const/4 v0, 0x0

    .line 41
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 42
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    invoke-virtual {v1, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setDisplayHeader(Z)V
    .locals 2

    const/4 v0, 0x0

    .line 65
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public setDividerColor(I)V
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->dividerPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method public setHeaderTextColor(I)V
    .locals 1

    const/4 v0, 0x0

    .line 69
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setCellTextColor(I)V

    return-void
.end method

.method public setNumRows(I)V
    .locals 1

    .line 157
    iget v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->oldNumRows:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x0

    .line 159
    iput v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->oldWidthMeasureSize:I

    .line 161
    :cond_0
    iput p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->oldNumRows:I

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 2

    const/4 v0, 0x0

    .line 73
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 74
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    invoke-virtual {v1, p1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setTypeface(Landroid/graphics/Typeface;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method
