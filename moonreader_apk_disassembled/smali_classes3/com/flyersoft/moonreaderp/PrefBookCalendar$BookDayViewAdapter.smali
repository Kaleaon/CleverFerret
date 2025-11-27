.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"

# interfaces
.implements Lcom/flyersoft/views/BookCalendar/DayViewAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "BookDayViewAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 385
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public makeCellView(Lcom/flyersoft/views/BookCalendar/CalendarCellView;Z)V
    .locals 11

    const/4 v0, 0x0

    if-nez p2, :cond_0

    .line 389
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    .line 390
    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->calendar_cell:I

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 392
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x7

    const/high16 v1, 0x40000000    # 2.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 393
    sget v1, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 394
    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    mul-int/lit8 v0, v0, 0x64

    .line 395
    div-int/lit8 v0, v0, 0x46

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 397
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->iv2:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    .line 398
    sget v2, Lcom/flyersoft/moonreaderp/R$id;->iv3:I

    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    .line 399
    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    div-int/lit8 v3, v3, 0x2

    iput v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 400
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    div-int/lit8 v1, v1, 0x2

    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 402
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->addView(Landroid/view/View;)V

    .line 403
    sget v0, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->setDayOfMonthTextView(Landroid/widget/TextView;)V

    return-void

    .line 406
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getTag()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;

    if-eqz p2, :cond_9

    .line 408
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getChildCount()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p1, v1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 409
    sget v3, Lcom/flyersoft/moonreaderp/R$id;->tv:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    .line 410
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->cardView:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 411
    sget v5, Lcom/flyersoft/moonreaderp/R$id;->progressLine:I

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/flyersoft/views/ProgressViews/ProgressLineView;

    .line 412
    sget v6, Lcom/flyersoft/moonreaderp/R$id;->iv:I

    invoke-virtual {v1, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/views/ShelfImageView;

    .line 413
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result v7

    const/4 v8, 0x4

    if-eqz v7, :cond_1

    const/4 v7, 0x0

    goto :goto_0

    :cond_1
    const/4 v7, 0x4

    :goto_0
    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setVisibility(I)V

    .line 414
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x0

    goto :goto_1

    :cond_2
    const/4 v7, 0x4

    :goto_1
    invoke-virtual {v4, v7}, Landroid/view/View;->setVisibility(I)V

    .line 415
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result v7

    if-eqz v7, :cond_3

    const/4 v7, 0x0

    goto :goto_2

    :cond_3
    const/4 v7, 0x4

    :goto_2
    invoke-virtual {v5, v7}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->setVisibility(I)V

    .line 416
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v7

    invoke-virtual {v7, v0}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 418
    invoke-virtual {p1}, Lcom/flyersoft/views/BookCalendar/CalendarCellView;->isCurrentMonth()Z

    move-result p1

    if-eqz p1, :cond_9

    .line 419
    invoke-virtual {p2}, Lcom/flyersoft/views/BookCalendar/MonthCellDescriptor;->getDate()Ljava/util/Date;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/Date;->getTime()J

    move-result-wide p1

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-static {v7}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->-$$Nest$mcalendarFixTime(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)J

    move-result-wide v9

    add-long/2addr p1, v9

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide p1

    .line 420
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v7, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    if-eqz p1, :cond_8

    .line 422
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getPrimary()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object p2

    iget-object p2, p2, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    .line 423
    sget v7, Lcom/flyersoft/moonreaderp/R$id;->myBookName2:I

    invoke-virtual {v4, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    .line 424
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v7, v6, p2, v0, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    .line 425
    invoke-virtual {v4}, Landroid/widget/TextView;->getVisibility()I

    move-result v6

    if-nez v6, :cond_4

    const/high16 v6, 0x41100000    # 9.0f

    .line 426
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/high16 v6, 0x40c00000    # 6.0f

    .line 427
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v9

    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v6

    invoke-virtual {v4, v7, v8, v9, v6}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 428
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getPrimary()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object v7

    invoke-virtual {v7}, Lcom/flyersoft/tools/BookDb$DayStatistics;->getBi()Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v7

    invoke-virtual {v6, p2, v7}, Lcom/flyersoft/moonreaderp/ActivityMain;->getBookName2(Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {v4, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 431
    :cond_4
    sget p2, Lcom/flyersoft/moonreaderp/R$id;->iv2:I

    invoke-virtual {v1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/flyersoft/views/ShelfImageView;

    .line 432
    sget v4, Lcom/flyersoft/moonreaderp/R$id;->iv3:I

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/views/ShelfImageView;

    .line 433
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getSecond()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object v4

    const/4 v6, 0x0

    const/16 v7, 0x8

    if-eqz v4, :cond_5

    .line 434
    invoke-virtual {v3}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/text/TextPaint;->setUnderlineText(Z)V

    .line 435
    invoke-virtual {p2, v0}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V

    .line 436
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getSecond()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object v3

    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    invoke-virtual {v2, p2, v3, v0, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    goto :goto_3

    .line 438
    :cond_5
    invoke-virtual {p2, v7}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V

    .line 439
    :goto_3
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getThird()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object p2

    if-eqz p2, :cond_6

    .line 440
    invoke-virtual {v1, v0}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V

    .line 441
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getThird()Lcom/flyersoft/tools/BookDb$DayStatistics;

    move-result-object v2

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    invoke-virtual {p2, v1, v2, v0, v6}, Lcom/flyersoft/moonreaderp/ActivityMain;->drawBookView(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;ZLandroid/view/View;)V

    goto :goto_4

    .line 443
    :cond_6
    invoke-virtual {v1, v7}, Lcom/flyersoft/views/ShelfImageView;->setVisibility(I)V

    .line 444
    :goto_4
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getDayHourProgress()I

    move-result p1

    iput p1, v5, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progress:I

    .line 446
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-static {}, Lcom/flyersoft/tools/C;->secondTextColor()I

    move-result p1

    goto :goto_5

    :cond_7
    iget p1, v5, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    :goto_5
    iput p1, v5, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineColor:I

    .line 447
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, v5, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->progressLineBackgroundColor:Ljava/lang/Integer;

    return-void

    .line 449
    :cond_8
    invoke-virtual {v4, v8}, Landroid/view/View;->setVisibility(I)V

    .line 450
    invoke-virtual {v5, v8}, Lcom/flyersoft/views/ProgressViews/ProgressLineView;->setVisibility(I)V

    :cond_9
    return-void
.end method
