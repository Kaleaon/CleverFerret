.class public Lcom/flyersoft/views/BookCalendar/MonthView;
.super Landroid/widget/LinearLayout;
.source "MonthView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/views/BookCalendar/MonthView$Listener;
    }
.end annotation


# instance fields
.field private alwaysDigitNumbers:Z

.field dayNamesHeaderRowView:Landroid/view/View;

.field private decorators:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;"
        }
    .end annotation
.end field

.field grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

.field private isRtl:Z

.field private listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

.field private locale:Ljava/util/Locale;

.field title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 107
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static create(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;Ljava/text/DateFormat;Lcom/flyersoft/views/BookCalendar/MonthView$Listener;Ljava/util/Calendar;IIIIZIZLjava/util/Locale;ZLcom/flyersoft/views/BookCalendar/DayViewAdapter;)Lcom/flyersoft/views/BookCalendar/MonthView;
    .locals 17

    const/4 v14, 0x0

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move/from16 v10, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move-object/from16 v15, p12

    move/from16 v13, p13

    move-object/from16 v16, p14

    .line 43
    invoke-static/range {v1 .. v16}, Lcom/flyersoft/views/BookCalendar/MonthView;->create(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;Ljava/text/DateFormat;Lcom/flyersoft/views/BookCalendar/MonthView$Listener;Ljava/util/Calendar;IIIIZIZZLjava/util/List;Ljava/util/Locale;Lcom/flyersoft/views/BookCalendar/DayViewAdapter;)Lcom/flyersoft/views/BookCalendar/MonthView;

    move-result-object v0

    return-object v0
.end method

.method public static create(Landroid/view/ViewGroup;Landroid/view/LayoutInflater;Ljava/text/DateFormat;Lcom/flyersoft/views/BookCalendar/MonthView$Listener;Ljava/util/Calendar;IIIIZIZZLjava/util/List;Ljava/util/Locale;Lcom/flyersoft/views/BookCalendar/DayViewAdapter;)Lcom/flyersoft/views/BookCalendar/MonthView;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "Landroid/view/LayoutInflater;",
            "Ljava/text/DateFormat;",
            "Lcom/flyersoft/views/BookCalendar/MonthView$Listener;",
            "Ljava/util/Calendar;",
            "IIIIZIZZ",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;",
            "Ljava/util/Locale;",
            "Lcom/flyersoft/views/BookCalendar/DayViewAdapter;",
            ")",
            "Lcom/flyersoft/views/BookCalendar/MonthView;"
        }
    .end annotation

    .line 53
    sget p5, Lcom/flyersoft/moonreaderp/R$layout;->callendar_month:I

    const/4 v0, 0x0

    invoke-virtual {p1, p5, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/views/BookCalendar/MonthView;

    .line 56
    new-instance p1, Landroid/widget/TextView;

    new-instance p5, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/MonthView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p5, v1, p8}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p1, p5}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->title:Landroid/widget/TextView;

    .line 57
    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result p5

    invoke-virtual {p1, p5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 58
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->calendar_grid:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/MonthView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    .line 59
    sget p1, Lcom/flyersoft/moonreaderp/R$id;->day_names_header_row:I

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/MonthView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->dayNamesHeaderRowView:Landroid/view/View;

    .line 62
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->title:Landroid/widget/TextView;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/BookCalendar/MonthView;->addView(Landroid/view/View;I)V

    move-object/from16 p1, p15

    .line 64
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V

    .line 65
    invoke-virtual {p0, v0}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDividerColor(I)V

    .line 66
    invoke-static {}, Lcom/flyersoft/tools/C;->mainTextColor()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDayTextColor(I)V

    .line 67
    invoke-virtual {p0, p9}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDisplayHeader(Z)V

    .line 68
    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/flyersoft/views/BookCalendar/MonthView;->setHeaderTextColor(I)V

    .line 69
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result p1

    invoke-virtual {p0, p1, p6}, Lcom/flyersoft/views/BookCalendar/MonthView;->setDayBackground(II)V

    .line 75
    invoke-static/range {p14 .. p14}, Landroidx/core/text/TextUtilsCompat;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result p1

    const/4 p5, 0x1

    if-ne p1, p5, :cond_0

    goto :goto_0

    :cond_0
    const/4 p5, 0x0

    :goto_0
    iput-boolean p5, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->isRtl:Z

    move-object/from16 p1, p14

    .line 76
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->locale:Ljava/util/Locale;

    move/from16 p1, p12

    .line 77
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->alwaysDigitNumbers:Z

    .line 78
    invoke-virtual {p4}, Ljava/util/Calendar;->getFirstDayOfWeek()I

    move-result p1

    .line 79
    iget-object p5, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {p5, v0}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object p5

    check-cast p5, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    if-eqz p11, :cond_2

    const/4 p6, 0x7

    .line 82
    invoke-virtual {p4, p6}, Ljava/util/Calendar;->get(I)I

    move-result v1

    :goto_1
    if-ge v0, p6, :cond_1

    .line 84
    iget-boolean v2, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->isRtl:Z

    invoke-static {p1, v0, v2}, Lcom/flyersoft/views/BookCalendar/MonthView;->getDayOfWeek(IIZ)I

    move-result v2

    invoke-virtual {p4, p6, v2}, Ljava/util/Calendar;->set(II)V

    .line 85
    invoke-virtual {p5, v0}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 86
    invoke-virtual {p4}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 88
    :cond_1
    invoke-virtual {p4, p6, v1}, Ljava/util/Calendar;->set(II)V

    goto :goto_2

    .line 90
    :cond_2
    iget-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->dayNamesHeaderRowView:Landroid/view/View;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    .line 93
    :goto_2
    iput-object p3, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    move-object/from16 p1, p13

    .line 94
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->decorators:Ljava/util/List;

    return-object p0
.end method

.method private static getDayOfWeek(IIZ)I
    .locals 0

    add-int/2addr p0, p1

    if-eqz p2, :cond_0

    rsub-int/lit8 p0, p0, 0x8

    :cond_0
    return p0
.end method


# virtual methods
.method public getDecorators()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;"
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->decorators:Ljava/util/List;

    return-object v0
.end method

.method public init(Lcom/flyersoft/views/BookCalendar/MonthDescriptor;Ljava/util/List;ZLandroid/graphics/Typeface;Landroid/graphics/Typeface;)V
    .locals 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flyersoft/views/BookCalendar/MonthDescriptor;",
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;",
            ">;>;Z",
            "Landroid/graphics/Typeface;",
            "Landroid/graphics/Typeface;",
            ")V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p4

    move-object/from16 v2, p5

    .line 120
    invoke-static {v0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v3, v4, v5

    const/4 v3, 0x1

    aput-object p1, v4, v3

    const-string v6, "Initializing MonthView (%d) for %s"

    invoke-static {v6, v4}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 122
    iget-object v4, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->title:Landroid/widget/TextView;

    invoke-virtual/range {p1 .. p1}, Lcom/flyersoft/views/BookCalendar/MonthDescriptor;->getLabel()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    iget-boolean v4, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->alwaysDigitNumbers:Z

    if-eqz v4, :cond_0

    .line 125
    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v4

    goto :goto_0

    .line 127
    :cond_0
    iget-object v4, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->locale:Ljava/util/Locale;

    invoke-static {v4}, Ljava/text/NumberFormat;->getInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v4

    .line 130
    :goto_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v8

    .line 131
    iget-object v9, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v9, v8}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setNumRows(I)V

    const/4 v9, 0x0

    :goto_1
    const/4 v10, 0x6

    if-ge v9, v10, :cond_7

    .line 133
    iget-object v10, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    add-int/lit8 v11, v9, 0x1

    invoke-virtual {v10, v11}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/flyersoft/views/BookCalendar/CalendarRowView;

    .line 134
    iget-object v12, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->listener:Lcom/flyersoft/views/BookCalendar/MonthView$Listener;

    invoke-virtual {v10, v12}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setListener(Lcom/flyersoft/views/BookCalendar/MonthView$Listener;)V

    if-ge v9, v8, :cond_6

    .line 136
    invoke-virtual {v10, v5}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setVisibility(I)V

    move-object/from16 v12, p2

    .line 137
    invoke-interface {v12, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    const/4 v13, 0x0

    .line 138
    :goto_2
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v14

    if-ge v13, v14, :cond_5

    .line 139
    iget-boolean v14, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->isRtl:Z

    if-eqz v14, :cond_1

    rsub-int/lit8 v14, v13, 0x6

    goto :goto_3

    :cond_1
    move v14, v13

    :goto_3
    invoke-interface {v9, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    .line 140
    invoke-virtual {v10, v13}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->getChildAt(I)Landroid/view/View;

    move-result-object v15

    check-cast v15, Lcom/flyersoft/views/BookCalendar/CalendarCellView;

    const/16 v16, 0x0

    .line 142
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getValue()I

    move-result v5

    move-wide/from16 v17, v6

    int-to-long v5, v5

    invoke-virtual {v4, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    .line 143
    invoke-virtual {v15}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getDayOfMonthTextView()Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 144
    invoke-virtual {v15}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getDayOfMonthTextView()Landroid/widget/TextView;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 146
    :cond_2
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isCurrentMonth()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setEnabled(Z)V

    xor-int/lit8 v5, p3, 0x1

    .line 147
    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setClickable(Z)V

    .line 149
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelectable()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setSelectable(Z)V

    .line 150
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isSelected()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setSelected(Z)V

    .line 151
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isCurrentMonth()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setCurrentMonth(Z)V

    .line 152
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isToday()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setToday(Z)V

    .line 153
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getRangeState()Lcom/flyersoft/views/BookCalendar/RangeState;

    move-result-object v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V

    .line 154
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->isHighlighted()Z

    move-result v5

    invoke-virtual {v15, v5}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setHighlighted(Z)V

    .line 155
    invoke-virtual {v15, v14}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setTag(Ljava/lang/Object;)V

    .line 158
    iget-object v5, v15, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    if-eqz v5, :cond_3

    .line 159
    iget-object v5, v15, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

    invoke-interface {v5, v15, v3}, Lcom/flyersoft/views/BookCalendar/DayViewAdapter;->makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V

    .line 161
    :cond_3
    iget-object v5, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->decorators:Ljava/util/List;

    if-eqz v5, :cond_4

    .line 162
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;

    .line 163
    invoke-virtual {v14}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object v7

    invoke-interface {v6, v15, v7}, Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;->decorate(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Ljava/util/Date;)V

    goto :goto_4

    :cond_4
    add-int/lit8 v13, v13, 0x1

    move-wide/from16 v6, v17

    const/4 v5, 0x0

    goto/16 :goto_2

    :cond_5
    move-wide/from16 v17, v6

    const/16 v16, 0x0

    goto :goto_5

    :cond_6
    move-object/from16 v12, p2

    move-wide/from16 v17, v6

    const/16 v16, 0x0

    const/16 v5, 0x8

    .line 168
    invoke-virtual {v10, v5}, Lcom/flyersoft/views/BookCalendar/CalendarRowView;->setVisibility(I)V

    :goto_5
    move v9, v11

    move-wide/from16 v6, v17

    const/4 v5, 0x0

    goto/16 :goto_1

    :cond_7
    move-wide/from16 v17, v6

    const/16 v16, 0x0

    if-eqz v1, :cond_8

    .line 173
    iget-object v4, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->title:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    :cond_8
    if-eqz v2, :cond_9

    .line 176
    iget-object v1, v0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v1, v2}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 179
    :cond_9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sub-long v1, v1, v17

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    new-array v2, v3, [Ljava/lang/Object;

    aput-object v1, v2, v16

    const-string v1, "MonthView.init took %d ms"

    invoke-static {v1, v2}, Lcom/flyersoft/views/BookCalendar/Logr;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public setDayBackground(II)V
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setDayBackground(II)V

    return-void
.end method

.method public setDayTextColor(I)V
    .locals 1

    .line 191
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setDayTextColor(I)V

    return-void
.end method

.method public setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setDayViewAdapter(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;Z)V

    return-void
.end method

.method public setDecorators(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/flyersoft/views/BookCalendar/CalendarCellDecorator;",
            ">;)V"
        }
    .end annotation

    .line 111
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->decorators:Ljava/util/List;

    return-void
.end method

.method public setDisplayHeader(Z)V
    .locals 1

    .line 199
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setDisplayHeader(Z)V

    return-void
.end method

.method public setDividerColor(I)V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setDividerColor(I)V

    return-void
.end method

.method public setHeaderTextColor(I)V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/MonthView;->grid:Lcom/flyersoft/views/BookCalendar/CalendarGridView;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/BookCalendar/CalendarGridView;->setHeaderTextColor(I)V

    return-void
.end method
