.class public Lcom/flyersoft/views/BookCalendar/DefaultDayViewAdapter;
.super Ljava/lang/Object;
.source "DefaultDayViewAdapter.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/DayViewAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V
    .locals 4

    if-nez p2, :cond_0

    .line 16
    new-instance p2, Landroid/widget/TextView;

    new-instance v0, Landroid/view/ContextThemeWrapper;

    .line 17
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$style;->CalendarCell_CalendarDate:I

    invoke-direct {v0, v1, v2}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    invoke-direct {p2, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setDuplicateParentStateEnabled(Z)V

    .line 20
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x2

    const/16 v2, 0x10

    const/4 v3, -0x1

    invoke-direct {v0, v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(III)V

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 22
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setDayOfMonthTextView(Landroid/widget/TextView;)V

    :cond_0
    return-void
.end method
