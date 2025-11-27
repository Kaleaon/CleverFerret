.class public Lcom/flyersoft/views/BookCalendar/CalendarCellView;
.super Landroid/widget/FrameLayout;
.source "CalendarCellView.java"


# static fields
.field private static final STATE_CURRENT_MONTH:[I

.field private static final STATE_HIGHLIGHTED:[I

.field private static final STATE_RANGE_FIRST:[I

.field private static final STATE_RANGE_LAST:[I

.field private static final STATE_RANGE_MIDDLE:[I

.field private static final STATE_SELECTABLE:[I

.field private static final STATE_TODAY:[I


# instance fields
.field private dayOfMonthTextView:Landroid/widget/TextView;

.field public dayViewAdapter:Lcom/flyersoft/views/BookCalendar/DayViewAdapter;

.field private isCurrentMonth:Z

.field private isHighlighted:Z

.field private isSelectable:Z

.field private isToday:Z

.field private rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 14
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_selectable:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_SELECTABLE:[I

    .line 17
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_current_month:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_CURRENT_MONTH:[I

    .line 20
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_today:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_TODAY:[I

    .line 23
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_highlighted:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_HIGHLIGHTED:[I

    .line 26
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_range_first:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_FIRST:[I

    .line 29
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_range_middle:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_MIDDLE:[I

    .line 32
    sget v0, Lcom/flyersoft/moonreaderp/R$attr;->tsquare_state_range_last:I

    filled-new-array {v0}, [I

    move-result-object v0

    sput-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_LAST:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 36
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isSelectable:Z

    .line 37
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth:Z

    .line 38
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isToday:Z

    .line 39
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isHighlighted:Z

    .line 40
    sget-object p1, Lcom/flyersoft/views/BookCalendar/RangeState;->NONE:Lcom/flyersoft/views/BookCalendar/RangeState;

    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    return-void
.end method


# virtual methods
.method public getDayOfMonthTextView()Landroid/widget/TextView;
    .locals 2

    .line 138
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->dayOfMonthTextView:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    return-object v0

    .line 139
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "You have to setDayOfMonthTextView in your custom DayViewAdapter."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getRangeState()Lcom/flyersoft/views/BookCalendar/RangeState;
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    return-object v0
.end method

.method public isCurrentMonth()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth:Z

    return v0
.end method

.method public isHighlighted()Z
    .locals 1

    .line 96
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isHighlighted:Z

    return v0
.end method

.method public isSelectable()Z
    .locals 1

    .line 92
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isSelectable:Z

    return v0
.end method

.method public isToday()Z
    .locals 1

    .line 88
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isToday:Z

    return v0
.end method

.method protected onCreateDrawableState(I)[I
    .locals 2

    add-int/lit8 p1, p1, 0x5

    .line 104
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onCreateDrawableState(I)[I

    move-result-object p1

    .line 106
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isSelectable:Z

    if-eqz v0, :cond_0

    .line 107
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_SELECTABLE:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    .line 110
    :cond_0
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth:Z

    if-eqz v0, :cond_1

    .line 111
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_CURRENT_MONTH:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    .line 114
    :cond_1
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isToday:Z

    if-eqz v0, :cond_2

    .line 115
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_TODAY:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    .line 118
    :cond_2
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isHighlighted:Z

    if-eqz v0, :cond_3

    .line 119
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_HIGHLIGHTED:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    .line 122
    :cond_3
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->FIRST:Lcom/flyersoft/views/BookCalendar/RangeState;

    if-ne v0, v1, :cond_4

    .line 123
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_FIRST:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    return-object p1

    .line 124
    :cond_4
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->MIDDLE:Lcom/flyersoft/views/BookCalendar/RangeState;

    if-ne v0, v1, :cond_5

    .line 125
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_MIDDLE:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    return-object p1

    .line 126
    :cond_5
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    sget-object v1, Lcom/flyersoft/views/BookCalendar/RangeState;->LAST:Lcom/flyersoft/views/BookCalendar/RangeState;

    if-ne v0, v1, :cond_6

    .line 127
    sget-object v0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->STATE_RANGE_LAST:[I

    invoke-static {p1, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->mergeDrawableStates([I[I)[I

    :cond_6
    return-object p1
.end method

.method public setCurrentMonth(Z)V
    .locals 1

    .line 56
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth:Z

    if-eq v0, p1, :cond_0

    .line 57
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth:Z

    .line 58
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method public setDayOfMonthTextView(Landroid/widget/TextView;)V
    .locals 0

    .line 134
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->dayOfMonthTextView:Landroid/widget/TextView;

    return-void
.end method

.method public setHighlighted(Z)V
    .locals 1

    .line 77
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isHighlighted:Z

    if-eq v0, p1, :cond_0

    .line 78
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isHighlighted:Z

    .line 79
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method public setRangeState(Lcom/flyersoft/views/BookCalendar/RangeState;)V
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    if-eq v0, p1, :cond_0

    .line 71
    iput-object p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->rangeState:Lcom/flyersoft/views/BookCalendar/RangeState;

    .line 72
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method public setSelectable(Z)V
    .locals 1

    .line 49
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isSelectable:Z

    if-eq v0, p1, :cond_0

    .line 50
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isSelectable:Z

    .line 51
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->refreshDrawableState()V

    :cond_0
    return-void
.end method

.method public setToday(Z)V
    .locals 1

    .line 63
    iget-boolean v0, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isToday:Z

    if-eq v0, p1, :cond_0

    .line 64
    iput-boolean p1, p0, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isToday:Z

    .line 65
    invoke-virtual {p0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->refreshDrawableState()V

    :cond_0
    return-void
.end method
