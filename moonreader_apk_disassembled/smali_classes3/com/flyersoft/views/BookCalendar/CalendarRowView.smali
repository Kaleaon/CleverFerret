.class public Lcom/flyersoft/views/BookCalendar/CalendarRowView;
.super Landroid/view/ViewGroup;
.source "CalendarRowView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private isHeaderRow:Z

.field private listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    .line 28
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 29
    invoke-super {p0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    invoke-interface {v0, p1}, Lcom/flyersoft/views/BookCalendar/MonthView$Listener;->handleClick(Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;)V

    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 5

    .line 60
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-int/2addr p5, p3

    sub-int/2addr p4, p2

    .line 63
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    const/4 p3, 0x0

    :goto_0
    if-ge p3, p1, :cond_0

    .line 64
    invoke-virtual {p0, p3}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    mul-int v3, p3, p4

    .line 65
    div-int/lit8 v3, v3, 0x7

    add-int/lit8 p3, p3, 0x1

    mul-int v4, p3, p4

    .line 66
    div-int/lit8 v4, v4, 0x7

    .line 67
    invoke-virtual {v2, v3, p2, v4, p5}, Landroid/view/View;->layout(IIII)V

    goto :goto_0

    .line 69
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p3, 0x1

    new-array p3, p3, [Ljava/lang/Object;

    aput-object p1, p3, p2

    const-string p1, "Row.onLayout %d ms"

    invoke-static {p1, p3}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 9

    .line 33
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 34
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    const/high16 p2, -0x80000000

    .line 36
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 37
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :cond_0
    :goto_0
    if-ge v4, v2, :cond_2

    .line 38
    invoke-virtual {p0, v4}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    mul-int v7, v4, p1

    .line 40
    div-int/lit8 v7, v7, 0x7

    add-int/lit8 v4, v4, 0x1

    mul-int v8, v4, p1

    .line 41
    div-int/lit8 v8, v8, 0x7

    sub-int/2addr v8, v7

    .line 43
    iget-boolean v7, p0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->isHeaderRow:Z

    if-nez v7, :cond_1

    .line 44
    invoke-virtual {v6, v8}, Landroid/view/View;->setMinimumHeight(I)V

    :cond_1
    const/high16 v7, 0x40000000    # 2.0f

    .line 46
    invoke-static {v8, v7}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 47
    invoke-virtual {v6, v7, p2}, Landroid/view/View;->measure(II)V

    .line 49
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    if-le v7, v5, :cond_0

    .line 50
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    goto :goto_0

    .line 53
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getPaddingLeft()I

    move-result p2

    add-int/2addr p1, p2

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getPaddingRight()I

    move-result p2

    add-int/2addr p1, p2

    .line 54
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getPaddingTop()I

    move-result p2

    add-int/2addr v5, p2

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getPaddingBottom()I

    move-result p2

    add-int/2addr v5, p2

    .line 55
    invoke-virtual {p0, p1, v5}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setMeasuredDimension(II)V

    .line 56
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    sub-long/2addr p1, v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    aput-object p1, p2, v3

    const-string p1, "Row.onMeasure %d ms"

    invoke-static {p1, p2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public setCellBackground(II)V
    .locals 1

    const/4 p1, 0x0

    .line 103
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result p2

    if-ge p1, p2, :cond_0

    .line 108
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->calendar_bg_selector2:I

    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 109
    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->calendar_bg_selector:I

    invoke-virtual {p2, v0}, Landroid/view/View;->setBackgroundResource(I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setCellTextColor(I)V
    .locals 2

    const/4 v0, 0x0

    .line 114
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 115
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    if-eqz v1, :cond_0

    .line 116
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getDayOfMonthTextView()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 118
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(I)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setCellTextColor(Landroid/content/res/ColorStateList;)V
    .locals 2

    const/4 v0, 0x0

    .line 124
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 125
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    if-eqz v1, :cond_0

    .line 126
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getDayOfMonthTextView()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    goto :goto_1

    .line 128
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 88
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_2

    .line 89
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    if-eqz v2, :cond_1

    .line 90
    invoke-virtual {p0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    .line 91
    iput-object p1, v2, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    if-eqz p2, :cond_0

    const/4 v3, 0x1

    .line 93
    invoke-interface {p1, v2, v3}, Lcom/flyersoft/views/BookCalendar/DayViewAdapter;->makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V

    goto :goto_1

    .line 95
    :cond_0
    invoke-virtual {v2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->removeAllViews()V

    .line 96
    invoke-interface {p1, v2, v0}, Lcom/flyersoft/views/BookCalendar/DayViewAdapter;->makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setIsHeaderRow(Z)V
    .locals 0

    .line 73
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->isHeaderRow:Z

    return-void
.end method

.method public setListener(Lcom/flyersoft/views/BookCalendar/MonthView$Listener;)V
    .locals 0

    .line 84
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    return-void
.end method

.method public setTypeface(Landroid/graphics/Typeface;)V
    .locals 2

    const/4 v0, 0x0

    .line 134
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 135
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    invoke-virtual {v1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getDayOfMonthTextView()Landroid/widget/TextView;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    goto :goto_1

    .line 138
    :cond_0
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
