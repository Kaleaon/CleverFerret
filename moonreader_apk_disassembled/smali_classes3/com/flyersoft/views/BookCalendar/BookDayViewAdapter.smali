.class public Lcom/flyersoft/views/BookCalendar/BookDayViewAdapter;
.super Ljava/lang/Object;
.source "BookDayViewAdapter.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/DayViewAdapter;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V
    .locals 4

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 17
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 18
    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->calendar_cell:I

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 20
    invoke-static {}, Lcom/flyersoft/tools/A;->sysAlertDialogWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x7

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 21
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 22
    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 23
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    mul-int/lit8 v0, v0, 0x64

    .line 24
    div-int/lit8 v0, v0, 0x46

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 26
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->addView(Landroid/view/View;)V

    .line 27
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setDayOfMonthTextView(Landroid/widget/TextView;)V

    return-void

    .line 29
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    if-eqz p2, :cond_3

    .line 31
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getChildCount()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    .line 32
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    .line 33
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/ImageView;

    .line 34
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result v2

    const/16 v3, 0x8

    if-eqz v2, :cond_1

    const/4 v2, 0x0

    goto :goto_0

    :cond_1
    const/16 v2, 0x8

    :goto_0
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 35
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    const/16 v0, 0x8

    :goto_1
    invoke-virtual {p2, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_3
    return-void
.end method
