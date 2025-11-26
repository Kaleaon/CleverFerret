.class public Lcom/flyersoft/moonreaderp/PrefYearStatistics;
.super Landroid/app/Dialog;
.source "PrefYearStatistics.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyYValueFormatter;,
        Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;,
        Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;,
        Lcom/flyersoft/moonreaderp/PrefYearStatistics$BookViewHolder;
    }
.end annotation


# instance fields
.field act:Lcom/flyersoft/moonreaderp/ActivityMain;

.field all:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
            ">;"
        }
    .end annotation
.end field

.field barChart:Lcom/github/mikephil/charting/charts/BarChart;

.field barMonth:I

.field barYear:I

.field con:Landroid/content/Context;

.field dateTv1:Landroid/widget/TextView;

.field dateTv2:Landroid/widget/TextView;

.field end_date:J

.field itemHeight:I

.field itemWidth:I

.field lay:Landroid/view/View;

.field read_time:J

.field read_words:J

.field selectedBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
            ">;"
        }
    .end annotation
.end field

.field start_date:J

.field years:[I


# direct methods
.method static bridge synthetic -$$Nest$mfillStatistics(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->fillStatistics()V

    return-void
.end method

.method static bridge synthetic -$$Nest$minitDays(Lcom/flyersoft/moonreaderp/PrefYearStatistics;JJ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initDays(JJ)V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetYearsTextColor(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setYearsTextColor()V

    return-void
.end method

.method static bridge synthetic -$$Nest$msetupBarChart(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setupBarChart(II)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshareAsImage(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->shareAsImage()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowOptions(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->showOptions(II)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mspeedLabel(Lcom/flyersoft/moonreaderp/PrefYearStatistics;FJZ)Landroid/text/Spanned;
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->speedLabel(FJZ)Landroid/text/Spanned;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mtimeLabel(Lcom/flyersoft/moonreaderp/PrefYearStatistics;FFZ)Landroid/text/Spanned;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->timeLabel(FFZ)Landroid/text/Spanned;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 69
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 70
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    .line 71
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->act:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 72
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget v0, Lcom/flyersoft/moonreaderp/R$layout;->statistics_year:I

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    .line 73
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private fillStatistics()V
    .locals 16

    move-object/from16 v0, p0

    const-wide/16 v1, 0x0

    .line 402
    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_words:J

    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_time:J

    .line 403
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    .line 404
    iget-wide v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {v3, v4}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide v3

    .line 405
    iget-wide v5, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {v5, v6}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide v5

    .line 407
    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->all:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x1

    const/4 v10, 0x0

    if-eqz v8, :cond_3

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 408
    iget-object v11, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-static {v11}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v11

    if-nez v11, :cond_2

    .line 409
    iput-wide v1, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    .line 410
    iput-wide v1, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    .line 412
    iget-object v11, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v11

    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_2

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 413
    iget-wide v13, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    cmp-long v15, v13, v3

    if-ltz v15, :cond_1

    iget-wide v13, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    cmp-long v15, v13, v5

    if-gtz v15, :cond_1

    if-nez v10, :cond_0

    .line 416
    iget-object v10, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v10, 0x1

    .line 418
    :cond_0
    iget-wide v13, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    iget-wide v1, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    add-long/2addr v13, v1

    iput-wide v13, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    .line 419
    iget-wide v1, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    iget-wide v13, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->words:J

    add-long/2addr v1, v13

    iput-wide v1, v8, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    .line 420
    iget-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_time:J

    iget-wide v13, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    add-long/2addr v1, v13

    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_time:J

    .line 421
    iget-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_words:J

    iget-wide v12, v12, Lcom/flyersoft/tools/BookDb$DayStatistics;->words:J

    add-long/2addr v1, v12

    iput-wide v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_words:J

    :cond_1
    const-wide/16 v1, 0x0

    goto :goto_1

    :cond_2
    const-wide/16 v1, 0x0

    goto :goto_0

    .line 427
    :cond_3
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 428
    sget v2, Lcom/flyersoft/tools/A;->year_book_time:F

    const/4 v7, 0x0

    const-wide/16 v11, 0x1

    cmpl-float v2, v2, v7

    if-lez v2, :cond_5

    .line 429
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    sub-int/2addr v2, v9

    :goto_2
    if-ltz v2, :cond_5

    .line 430
    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    iget-wide v7, v7, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    long-to-float v7, v7

    invoke-static {v11, v12}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v13

    long-to-float v8, v13

    div-float/2addr v7, v8

    sget v8, Lcom/flyersoft/tools/A;->year_book_time:F

    cmpg-float v7, v7, v8

    if-gez v7, :cond_4

    .line 431
    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_4
    add-int/lit8 v2, v2, -0x1

    goto :goto_2

    .line 433
    :cond_5
    iget-wide v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_time:J

    long-to-float v2, v7

    invoke-static {v11, v12}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v7

    long-to-float v7, v7

    div-float/2addr v2, v7

    .line 434
    iget-wide v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_time:J

    long-to-float v7, v7

    invoke-static {v11, v12}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v11

    long-to-float v8, v11

    div-float/2addr v7, v8

    .line 435
    iget-object v8, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v11, Lcom/flyersoft/moonreaderp/R$id;->hoursTv:I

    invoke-virtual {v8, v11}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    invoke-direct {v0, v2, v7, v10}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->timeLabel(FFZ)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 436
    iget-object v7, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v8, Lcom/flyersoft/moonreaderp/R$id;->speedTv:I

    invoke-virtual {v7, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    iget-wide v11, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->read_words:J

    invoke-direct {v0, v2, v11, v12, v10}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->speedLabel(FJZ)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v7, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 437
    iget-object v2, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v7, Lcom/flyersoft/moonreaderp/R$id;->booksTv:I

    invoke-virtual {v2, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    new-instance v7, Ljava/lang/StringBuilder;

    const-string v8, ""

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 439
    invoke-direct {v0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->listBooks()V

    if-lez v1, :cond_6

    .line 441
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_6

    cmp-long v1, v3, v5

    if-eqz v1, :cond_6

    .line 442
    iget-object v1, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->read_hour:I

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "  > "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v3, Lcom/flyersoft/tools/A;->year_book_time:F

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->hours:I

    .line 443
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ": 0"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 442
    invoke-static {v1, v2, v9}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    :cond_6
    return-void
.end method

.method private getDayReadTime(III)F
    .locals 7

    .line 266
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    add-int/lit8 p2, p2, -0x1

    .line 267
    invoke-virtual {v0, p1, p2, p3}, Ljava/util/Calendar;->set(III)V

    .line 268
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide p1

    .line 271
    iget-object p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->all:Ljava/util/ArrayList;

    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    const-wide/16 v0, 0x0

    :cond_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 272
    iget-object v3, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-static {v3}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 273
    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 274
    iget-wide v4, v3, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    cmp-long v6, v4, p1

    if-nez v6, :cond_1

    .line 275
    iget-wide v3, v3, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    add-long/2addr v0, v3

    goto :goto_0

    :cond_2
    long-to-float p1, v0

    const-wide/16 p2, 0x1

    .line 280
    invoke-static {p2, p3}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide p2

    long-to-float p2, p2

    div-float/2addr p1, p2

    return p1
.end method

.method private getMonthReadTime(II)F
    .locals 10

    .line 245
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    add-int/lit8 v1, p2, -0x1

    const/4 v2, 0x1

    .line 246
    invoke-virtual {v0, p1, v1, v2}, Ljava/util/Calendar;->set(III)V

    .line 247
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide v2

    .line 248
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 249
    invoke-static {p1, p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(II)Ljava/time/YearMonth;

    move-result-object p2

    invoke-static {p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Ljava/time/YearMonth;)I

    move-result p2

    invoke-virtual {v0, p1, v1, p2}, Ljava/util/Calendar;->set(III)V

    .line 250
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p1

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide p1

    .line 253
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->all:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v4, 0x0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 254
    iget-object v6, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-static {v6}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 255
    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 256
    iget-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    cmp-long v9, v7, v2

    if-ltz v9, :cond_1

    iget-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    cmp-long v9, v7, p1

    if-gtz v9, :cond_1

    .line 257
    iget-wide v6, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    add-long/2addr v4, v6

    goto :goto_0

    :cond_2
    long-to-float p1, v4

    const-wide/16 v0, 0x1

    .line 262
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v0

    long-to-float p2, v0

    div-float/2addr p1, p2

    return p1
.end method

.method private initDays(JJ)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    .line 295
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p1

    .line 296
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object p2

    .line 297
    invoke-virtual {p2}, Ljava/util/Calendar;->clear()V

    const/4 p3, 0x1

    .line 298
    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    move-result p4

    invoke-virtual {p2, p3, p4}, Ljava/util/Calendar;->set(II)V

    .line 299
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    sput-wide v0, Lcom/flyersoft/tools/A;->statistics_start_day:J

    .line 300
    invoke-virtual {p2}, Ljava/util/Calendar;->clear()V

    .line 301
    invoke-virtual {p1, p3}, Ljava/util/Calendar;->get(I)I

    move-result p1

    invoke-virtual {p2, p3, p1}, Ljava/util/Calendar;->set(II)V

    const/4 p1, 0x6

    const/4 p3, -0x1

    .line 302
    invoke-virtual {p2, p1, p3}, Ljava/util/Calendar;->roll(II)V

    .line 303
    invoke-virtual {p2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide p3

    sput-wide p3, Lcom/flyersoft/tools/A;->statistics_end_day:J

    move-wide p1, v0

    .line 305
    :cond_0
    iput-wide p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 306
    iput-wide p3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 310
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->date1:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    .line 311
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget p2, Lcom/flyersoft/moonreaderp/R$id;->date2:I

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    .line 312
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-wide p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 313
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-wide p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$4;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 366
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 367
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private initStatistics()V
    .locals 9

    .line 374
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllStatistics()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->all:Ljava/util/ArrayList;

    .line 375
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 376
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 377
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    .line 379
    :try_start_0
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 380
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 381
    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 382
    const-string v5, "@"

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v4, :cond_1

    .line 384
    new-instance v6, Lcom/flyersoft/tools/BookDb$DayStatistics;

    invoke-direct {v6}, Lcom/flyersoft/tools/BookDb$DayStatistics;-><init>()V

    .line 385
    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    iput-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    add-int/lit8 v4, v4, 0x1

    .line 386
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v4

    int-to-long v7, v4

    iput-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    if-lez v5, :cond_2

    add-int/lit8 v5, v5, 0x1

    .line 387
    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    goto :goto_2

    :cond_2
    const-wide/16 v3, 0x0

    :goto_2
    iput-wide v3, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->words:J

    .line 388
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 392
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 396
    :cond_3
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->listYears()V

    return-void
.end method

.method private initView()V
    .locals 4

    .line 95
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v0, :cond_1

    .line 96
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->dateLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    sget-boolean v1, Lcom/flyersoft/tools/A;->amoled:Z

    if-eqz v1, :cond_0

    const v1, -0xcfcfd0

    goto :goto_0

    :cond_0
    const v1, -0x9f9fa0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ok:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$1;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 104
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->menu:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$2;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 128
    sget-wide v0, Lcom/flyersoft/tools/A;->statistics_start_day:J

    sget-wide v2, Lcom/flyersoft/tools/A;->statistics_end_day:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initDays(JJ)V

    .line 129
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initStatistics()V

    .line 130
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->fillStatistics()V

    .line 132
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->barChart:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/github/mikephil/charting/charts/BarChart;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    .line 133
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v0

    const/4 v1, -0x1

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setupBarChart(II)V

    return-void
.end method

.method private listBooks()V
    .locals 6

    .line 545
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->selectedBooks:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$7;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 554
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    .line 556
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$layout;->statistics_book:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    .line 557
    invoke-virtual {v1, v2, v2}, Landroid/view/View;->measure(II)V

    .line 558
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    iput v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->itemWidth:I

    .line 559
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->itemHeight:I

    .line 560
    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->itemWidth:I

    int-to-float v1, v1

    invoke-static {v1}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->itemHeight:I

    int-to-float v3, v3

    invoke-static {v3}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    const-string v5, "item"

    aput-object v5, v4, v2

    const/4 v5, 0x1

    aput-object v1, v4, v5

    const/4 v1, 0x2

    aput-object v3, v4, v1

    invoke-static {v4}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 561
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout$LayoutParams;

    iget v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->itemHeight:I

    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 563
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v1, v3, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 564
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$BooksRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method private listYears()V
    .locals 8

    const/4 v0, 0x0

    .line 464
    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    const-wide/16 v0, 0x0

    .line 466
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v0

    add-int/lit16 v1, v0, -0x7da

    const/4 v2, 0x0

    if-lez v1, :cond_0

    add-int/lit16 v0, v0, -0x7d9

    .line 468
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    const/4 v0, 0x0

    .line 469
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    array-length v3, v1

    if-ge v0, v3, :cond_0

    const/16 v3, 0x7da

    add-int/2addr v3, v0

    .line 470
    aput v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 473
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->horizontalScrollView1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 474
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->yearLay:I

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 475
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    if-nez v3, :cond_1

    const/16 v1, 0x8

    .line 476
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void

    .line 480
    :cond_1
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$5;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 498
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    array-length v4, v3

    const/4 v5, 0x4

    const/high16 v6, 0x42a00000    # 80.0f

    if-ge v4, v5, :cond_2

    goto :goto_1

    :cond_2
    array-length v3, v3

    const/4 v4, 0x3

    if-ge v3, v4, :cond_3

    goto :goto_1

    :cond_3
    const/high16 v6, 0x428c0000    # 70.0f

    :goto_1
    invoke-static {v6}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    const/4 v4, 0x0

    .line 500
    :goto_2
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    array-length v5, v5

    if-ge v4, v5, :cond_5

    .line 501
    new-instance v5, Landroid/widget/TextView;

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v5, v6}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 502
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    aget v6, v6, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 503
    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, ""

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->years:[I

    aget v7, v7, v4

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v6, 0x11

    .line 504
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setGravity(I)V

    .line 505
    sget-boolean v6, Lcom/flyersoft/tools/A;->isTablet:Z

    if-eqz v6, :cond_4

    const/high16 v6, 0x41600000    # 14.0f

    goto :goto_3

    :cond_4
    const/high16 v6, 0x41400000    # 12.0f

    :goto_3
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextSize(F)V

    const/4 v6, 0x1

    .line 506
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 507
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 508
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getSelectedRes(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 509
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 510
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x1

    invoke-direct {v6, v3, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    .line 512
    :cond_5
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setYearsTextColor()V

    .line 514
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1, v3}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;Landroid/os/Looper;I)V

    const-wide/16 v3, 0x32

    .line 523
    invoke-virtual {v0, v2, v3, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$6;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private setYearsTextColor()V
    .locals 9

    .line 527
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->yearLay:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 528
    const-string v1, ""

    const/4 v2, 0x0

    invoke-static {v1, v2}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v1

    .line 529
    iget-wide v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-virtual {p0, v3, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v3

    .line 530
    iget-wide v4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-virtual {p0, v4, v5}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getYear(J)I

    move-result v4

    if-ge v4, v3, :cond_0

    move v4, v3

    :cond_0
    const/4 v5, 0x0

    .line 534
    :goto_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v6

    if-ge v5, v6, :cond_4

    .line 535
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 536
    invoke-virtual {v6}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    if-lt v7, v3, :cond_1

    if-gt v7, v4, :cond_1

    const/4 v7, 0x1

    goto :goto_1

    :cond_1
    const/4 v7, 0x0

    :goto_1
    if-eqz v7, :cond_3

    .line 538
    sget-boolean v8, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v8, :cond_2

    const/4 v8, -0x1

    goto :goto_2

    :cond_2
    const/high16 v8, -0x1000000

    goto :goto_2

    :cond_3
    const v8, -0x777778

    :goto_2
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 539
    invoke-virtual {v6, v1, v7}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method private setupBarChart(II)V
    .locals 9

    .line 138
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/charts/BarChart;->setDrawValueAboveBar(Z)V

    .line 139
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getDescription()Lcom/github/mikephil/charting/components/Description;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/components/Description;->setText(Ljava/lang/String;)V

    .line 140
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getDescription()Lcom/github/mikephil/charting/components/Description;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/components/Description;->setEnabled(Z)V

    .line 141
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0, v1}, Lcom/github/mikephil/charting/charts/BarChart;->setFitBars(Z)V

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, -0x1

    if-ne p2, v3, :cond_0

    const/4 v4, 0x1

    :goto_0
    const/16 v5, 0xc

    if-gt v4, v5, :cond_1

    .line 149
    new-instance v5, Lcom/github/mikephil/charting/data/BarEntry;

    int-to-float v6, v4

    invoke-direct {p0, p1, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getMonthReadTime(II)F

    move-result v7

    invoke-direct {v5, v6, v7}, Lcom/github/mikephil/charting/data/BarEntry;-><init>(FF)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 151
    :cond_0
    invoke-static {p1, p2}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(II)Ljava/time/YearMonth;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/A$$ExternalSyntheticApiModelOutline0;->m(Ljava/time/YearMonth;)I

    move-result v5

    const/4 v4, 0x1

    :goto_1
    if-gt v4, v5, :cond_1

    .line 153
    new-instance v6, Lcom/github/mikephil/charting/data/BarEntry;

    int-to-float v7, v4

    invoke-direct {p0, p1, p2, v4}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getDayReadTime(III)F

    move-result v8

    invoke-direct {v6, v7, v8}, Lcom/github/mikephil/charting/data/BarEntry;-><init>(FF)V

    invoke-interface {v0, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 156
    :cond_1
    sget-boolean v4, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v4, :cond_2

    const/4 v4, -0x1

    goto :goto_2

    :cond_2
    const/high16 v4, -0x1000000

    .line 157
    :goto_2
    new-instance v6, Lcom/github/mikephil/charting/data/BarDataSet;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->read_hour:I

    invoke-static {v7}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v0, v7}, Lcom/github/mikephil/charting/data/BarDataSet;-><init>(Ljava/util/List;Ljava/lang/String;)V

    .line 158
    sget-boolean v0, Lcom/flyersoft/tools/A;->mainNightTheme:Z

    if-eqz v0, :cond_3

    const/high16 v0, -0x560000

    goto :goto_3

    :cond_3
    const/high16 v0, -0x10000

    :goto_3
    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/data/BarDataSet;->setColor(I)V

    .line 161
    new-instance v0, Lcom/github/mikephil/charting/data/BarData;

    new-array v7, v1, [Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;

    aput-object v6, v7, v2

    invoke-direct {v0, v7}, Lcom/github/mikephil/charting/data/BarData;-><init>([Lcom/github/mikephil/charting/interfaces/datasets/IBarDataSet;)V

    .line 162
    new-instance v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyYValueFormatter;

    invoke-direct {v6, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyYValueFormatter;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 163
    invoke-virtual {v0, v6}, Lcom/github/mikephil/charting/data/BarData;->setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V

    .line 164
    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/data/BarData;->setValueTextColor(I)V

    .line 165
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v6, v0}, Lcom/github/mikephil/charting/charts/BarChart;->setData(Lcom/github/mikephil/charting/data/ChartData;)V

    .line 166
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getLegend()Lcom/github/mikephil/charting/components/Legend;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/components/Legend;->setTextColor(I)V

    .line 167
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getDescription()Lcom/github/mikephil/charting/components/Description;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/github/mikephil/charting/components/Description;->setTextColor(I)V

    .line 168
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    const/4 v6, 0x0

    invoke-virtual {v0, v6}, Lcom/github/mikephil/charting/charts/BarChart;->highlightValue(Lcom/github/mikephil/charting/highlight/Highlight;)V

    .line 172
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barMonth:I

    .line 173
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    new-instance v6, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;

    invoke-direct {v6, p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$3;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;II)V

    invoke-virtual {v0, v6}, Lcom/github/mikephil/charting/charts/BarChart;->setOnChartValueSelectedListener(Lcom/github/mikephil/charting/listener/OnChartValueSelectedListener;)V

    .line 206
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$MyXValueFormatter;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;)V

    .line 207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/github/mikephil/charting/components/XAxis;->setValueFormatter(Lcom/github/mikephil/charting/formatter/ValueFormatter;)V

    .line 208
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    sget-object v0, Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;->BOTTOM:Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;

    invoke-virtual {p1, v0}, Lcom/github/mikephil/charting/components/XAxis;->setPosition(Lcom/github/mikephil/charting/components/XAxis$XAxisPosition;)V

    .line 209
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/github/mikephil/charting/components/XAxis;->setTextColor(I)V

    .line 210
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/github/mikephil/charting/components/XAxis;->setDrawGridLines(Z)V

    .line 211
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    invoke-virtual {p1, v5, v2}, Lcom/github/mikephil/charting/components/XAxis;->setLabelCount(IZ)V

    .line 212
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/github/mikephil/charting/components/XAxis;->setAxisMinimum(F)V

    .line 213
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    if-ne p2, v3, :cond_4

    const/4 p2, 0x0

    goto :goto_4

    :cond_4
    const/high16 p2, -0x3d4c0000    # -90.0f

    :goto_4
    invoke-virtual {p1, p2}, Lcom/github/mikephil/charting/components/XAxis;->setLabelRotationAngle(F)V

    .line 214
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getXAxis()Lcom/github/mikephil/charting/components/XAxis;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/github/mikephil/charting/components/XAxis;->setAvoidFirstLastClipping(Z)V

    .line 215
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getAxisRight()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/github/mikephil/charting/components/YAxis;->setEnabled(Z)V

    .line 216
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->getAxisLeft()Lcom/github/mikephil/charting/components/YAxis;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/github/mikephil/charting/components/YAxis;->setEnabled(Z)V

    .line 217
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barChart:Lcom/github/mikephil/charting/charts/BarChart;

    invoke-virtual {p1}, Lcom/github/mikephil/charting/charts/BarChart;->invalidate()V

    return-void
.end method

.method private shareAsImage()V
    .locals 4

    .line 685
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 686
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 687
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->statistics_header:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 688
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 689
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->statistics_header:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 691
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 693
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/read_statistics.jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 694
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    .line 695
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 696
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 697
    const-string v2, "image/png"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 698
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 699
    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 700
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    .line 701
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 702
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v0, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 704
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private showOptions(II)V
    .locals 10

    .line 709
    new-instance v0, Landroid/widget/LinearLayout;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 710
    new-instance v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 711
    new-instance v2, Landroid/widget/EditText;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v2, v3}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 712
    new-instance v3, Landroid/widget/TextView;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {v3, v4}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 714
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->read_hour:I

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "  > "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/16 v4, 0x2000

    .line 715
    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setInputType(I)V

    .line 716
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, ""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v6, Lcom/flyersoft/tools/A;->year_book_time:F

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 717
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v7, Lcom/flyersoft/moonreaderp/R$string;->hours:I

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, ")"

    const-string v7, " ("

    const/4 v8, -0x1

    if-eq p2, v8, :cond_0

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    move-object p2, v5

    :goto_0
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p2, 0x0

    .line 719
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 720
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 721
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 722
    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 724
    new-instance p2, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    invoke-direct {p2, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->shelf_reading_state_filter:I

    .line 725
    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eq p1, v8, :cond_1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    :cond_1
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/flyersoft/components/MyDialog;->setTitle(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 726
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;

    invoke-direct {p2, p0, v2}, Lcom/flyersoft/moonreaderp/PrefYearStatistics$8;-><init>(Lcom/flyersoft/moonreaderp/PrefYearStatistics;Landroid/widget/EditText;)V

    const v0, 0x104000a

    .line 727
    invoke-virtual {p1, v0, p2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 p2, 0x1040000

    const/4 v0, 0x0

    .line 733
    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 734
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void
.end method

.method private speedLabel(FJZ)Landroid/text/Spanned;
    .locals 4

    .line 459
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    const-string v3, "0"

    cmpl-float v2, p1, v2

    if-lez v2, :cond_0

    new-instance v2, Ljava/text/DecimalFormat;

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-float p2, p2

    div-float/2addr p2, p1

    float-to-double p1, p2

    invoke-virtual {v2, p1, p2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v3

    :cond_0
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_1

    .line 460
    const-string p1, "<small>"

    goto :goto_0

    :cond_1
    move-object p1, v1

    :goto_0
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSpeedTagShort()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_2

    const-string v1, "</small>"

    :cond_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 459
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    return-object p1
.end method

.method private timeLabel(FFZ)Landroid/text/Spanned;
    .locals 9

    const/high16 v0, 0x41200000    # 10.0f

    .line 448
    const-string v1, "0"

    cmpg-float v0, p2, v0

    if-gez v0, :cond_0

    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.00"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x42c80000    # 100.0f

    cmpg-float v0, p2, v0

    if-gez v0, :cond_1

    .line 449
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.0"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 450
    :cond_1
    new-instance v0, Ljava/text/DecimalFormat;

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    .line 451
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x0

    cmpl-float v5, p2, v4

    if-lez v5, :cond_2

    float-to-double v5, p2

    const-wide v7, 0x3f847ae147ae147bL    # 0.01

    cmpg-double p2, v5, v7

    if-gez p2, :cond_2

    .line 452
    const-string v1, "0.01"

    goto :goto_1

    :cond_2
    cmpl-float p1, p1, v4

    if-lez p1, :cond_3

    move-object v1, v0

    :cond_3
    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 453
    sget-boolean p1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    if-eqz p1, :cond_4

    move-object p1, v3

    goto :goto_2

    :cond_4
    const-string p1, " "

    :goto_2
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_5

    .line 454
    const-string p1, "<small>"

    goto :goto_3

    :cond_5
    move-object p1, v3

    :goto_3
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->con:Landroid/content/Context;

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->hours:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_6

    const-string v3, "</small>"

    :cond_6
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 451
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public dismiss()V
    .locals 2

    .line 738
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    .line 739
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    sput-wide v0, Lcom/flyersoft/tools/A;->statistics_start_day:J

    .line 740
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    sput-wide v0, Lcom/flyersoft/tools/A;->statistics_end_day:J

    return-void
.end method

.method public getYear(J)I
    .locals 4

    .line 284
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-lez v3, :cond_0

    .line 286
    invoke-virtual {v0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    :cond_0
    const/4 p1, 0x1

    .line 287
    invoke-virtual {v0, p1}, Ljava/util/Calendar;->get(I)I

    move-result p1

    return p1
.end method

.method public onBackPressed()V
    .locals 6

    .line 745
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    if-lez v0, :cond_0

    iget v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barMonth:I

    if-lez v1, :cond_0

    const/4 v1, -0x1

    .line 746
    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setupBarChart(II)V

    .line 747
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 748
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 749
    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v2}, Ljava/util/Calendar;->set(II)V

    .line 750
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    .line 751
    invoke-virtual {v0}, Ljava/util/Calendar;->clear()V

    .line 752
    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->barYear:I

    invoke-virtual {v0, v3, v2}, Ljava/util/Calendar;->set(II)V

    const/4 v2, 0x6

    .line 753
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->roll(II)V

    .line 754
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    .line 755
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv1:Landroid/widget/TextView;

    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->start_date:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 756
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->dateTv2:Landroid/widget/TextView;

    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->end_date:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {}, Lcom/flyersoft/tools/A;->getLocale()Ljava/util/Locale;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->dateToStr(Ljava/lang/Long;Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 757
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->fillStatistics()V

    .line 758
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->setYearsTextColor()V

    return-void

    .line 761
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 78
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 80
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 81
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, -0x2

    .line 82
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v0, 0x11

    .line 83
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const v0, 0x3f4ccccd    # 0.8f

    .line 84
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 85
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 86
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 87
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 89
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->lay:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 90
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefYearStatistics;->initView()V

    return-void
.end method
