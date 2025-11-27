.class public Lcom/flyersoft/moonreaderp/PrefBookCalendar;
.super Landroid/app/Dialog;
.source "PrefBookCalendar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;,
        Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;,
        Lcom/flyersoft/moonreaderp/PrefBookCalendar$BooksRvAdapter;,
        Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookViewHolder;
    }
.end annotation


# instance fields
.field all:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
            ">;"
        }
    .end annotation
.end field

.field calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

.field con:Landroid/content/Context;

.field dateBooks:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Long;",
            "Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;",
            ">;"
        }
    .end annotation
.end field

.field firstReadDate:J

.field firstReadTime:J

.field itemHeight:I

.field itemWidth:I

.field lay:Landroid/view/View;

.field main:Lcom/flyersoft/moonreaderp/ActivityMain;

.field monthBegin:Ljava/util/Calendar;

.field monthEnd:Ljava/util/Calendar;

.field read_time:J

.field read_words:J

.field rv:Landroidx/recyclerview/widget/RecyclerView;

.field selectedBooks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$ReadStatistics;",
            ">;"
        }
    .end annotation
.end field

.field start_time:J

.field title:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$mShareImg(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->ShareImg()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mcalendarFixTime(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)J
    .locals 2

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendarFixTime()J

    move-result-wide v0

    return-wide v0
.end method

.method static bridge synthetic -$$Nest$mchangeRangedMode(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->changeRangedMode()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgetSelectedDayBooks(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getSelectedDayBooks()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mgoMonth(Lcom/flyersoft/moonreaderp/PrefBookCalendar;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->goMonth(I)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mlistBooks(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->listBooks()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mshowCalendar(Lcom/flyersoft/moonreaderp/PrefBookCalendar;J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->showCalendar(J)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mspeedText(Lcom/flyersoft/moonreaderp/PrefBookCalendar;FJZ)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->speedText(FJZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mtimeText(Lcom/flyersoft/moonreaderp/PrefBookCalendar;FFZ)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->timeText(FFZ)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 1

    .line 56
    sget-boolean v0, Lcom/flyersoft/tools/A;->eink:Z

    if-eqz v0, :cond_0

    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen_ink:I

    goto :goto_0

    :cond_0
    sget v0, Lcom/flyersoft/moonreaderp/R$style;->dialog_fullscreen:I

    :goto_0
    invoke-direct {p0, p1, v0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    .line 222
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    .line 224
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    .line 57
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    .line 58
    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->main:Lcom/flyersoft/moonreaderp/ActivityMain;

    .line 59
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$layout;->statistics_calendar:I

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    .line 60
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setContentView(Landroid/view/View;)V

    return-void
.end method

.method private ShareImg()V
    .locals 4

    .line 609
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 610
    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 611
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v3, Lcom/flyersoft/moonreaderp/R$id;->statistics_header:I

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 612
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 613
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->statistics_header:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 615
    invoke-static {v0}, Lcom/flyersoft/tools/T;->isRecycled(Landroid/graphics/Bitmap;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 617
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->book_cache:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/read_calendar.jpg"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 618
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->bitmapToFile(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    .line 619
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v2}, Lcom/flyersoft/tools/A;->getUriProvider(Landroid/content/Context;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 620
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.SEND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 621
    const-string v2, "image/png"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 622
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 623
    const-string v2, "android.intent.extra.STREAM"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    const/4 v0, 0x1

    .line 624
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/high16 v0, 0x10000000

    .line 625
    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 626
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

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

    .line 628
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private calendarFixTime()J
    .locals 2

    const-wide/16 v0, 0x1

    .line 282
    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v0

    return-wide v0
.end method

.method private changeRangedMode()V
    .locals 2

    .line 633
    sget-boolean v0, Lcom/flyersoft/tools/A;->callendarRangeMode:Z

    xor-int/lit8 v0, v0, 0x1

    sput-boolean v0, Lcom/flyersoft/tools/A;->callendarRangeMode:Z

    .line 634
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->showCalendar(J)V

    return-void
.end method

.method private fillStatistics()V
    .locals 10

    const-wide/16 v0, 0x0

    .line 227
    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->read_words:J

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->read_time:J

    .line 229
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->all:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 230
    iget-object v4, v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-static {v4}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 231
    iget-object v3, v3, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_1
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 232
    iget-wide v5, v4, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    invoke-virtual {p0, v5, v6}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getDateBook(J)Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    move-result-object v5

    .line 233
    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 234
    iget-wide v5, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadDate:J

    cmp-long v7, v5, v0

    if-eqz v7, :cond_2

    iget-wide v5, v4, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    iget-wide v7, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadDate:J

    cmp-long v9, v5, v7

    if-gez v9, :cond_1

    .line 235
    :cond_2
    iget-wide v4, v4, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    iput-wide v4, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadDate:J

    goto :goto_0

    .line 240
    :cond_3
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadDate:J

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadTime:J

    .line 241
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v2

    div-long/2addr v0, v2

    const-wide/16 v2, 0x16d

    cmp-long v4, v0, v2

    if-gez v4, :cond_4

    .line 242
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->day(J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadTime:J

    .line 244
    :cond_4
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initCalendar()V

    .line 245
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setDateSelecteEvent()V

    return-void
.end method

.method private getSelectedDayBooks()V
    .locals 5

    .line 286
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 287
    sget-boolean v0, Lcom/flyersoft/tools/A;->callendarRangeMode:Z

    if-nez v0, :cond_0

    .line 288
    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendarFixTime()J

    move-result-wide v2

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide v0

    .line 289
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    if-eqz v0, :cond_2

    .line 291
    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 292
    invoke-direct {p0, v1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->saveFromDateBookToSelectedBooks(Lcom/flyersoft/tools/BookDb$DayStatistics;)V

    goto :goto_0

    .line 294
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    invoke-virtual {v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->getSelectedDates()Ljava/util/List;

    move-result-object v0

    .line 295
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Date;

    .line 296
    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendarFixTime()J

    move-result-wide v3

    add-long/2addr v1, v3

    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->getDayNumber(J)J

    move-result-wide v1

    .line 297
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    if-eqz v1, :cond_1

    .line 299
    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 300
    invoke-direct {p0, v2}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->saveFromDateBookToSelectedBooks(Lcom/flyersoft/tools/BookDb$DayStatistics;)V

    goto :goto_1

    :cond_2
    return-void
.end method

.method private goMonth(I)V
    .locals 4

    .line 140
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    .line 141
    new-instance v1, Ljava/util/Date;

    iget-wide v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v1}, Ljava/util/Calendar;->setTime(Ljava/util/Date;)V

    const/4 v1, 0x2

    .line 142
    invoke-virtual {v0, v1, p1}, Ljava/util/Calendar;->add(II)V

    const/4 p1, 0x5

    const/4 v1, 0x1

    .line 143
    invoke-virtual {v0, p1, v1}, Ljava/util/Calendar;->set(II)V

    .line 144
    invoke-virtual {v0}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    .line 145
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthBegin:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-ltz p1, :cond_0

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthEnd:Ljava/util/Calendar;

    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-gtz p1, :cond_0

    .line 146
    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->showCalendar(J)V

    return-void

    .line 148
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->no_more_found:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void
.end method

.method private initCalendar()V
    .locals 3

    .line 252
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->calendar_view:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    .line 256
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthBegin:Ljava/util/Calendar;

    .line 257
    iget-wide v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->firstReadTime:J

    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 258
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthEnd:Ljava/util/Calendar;

    const/4 v1, 0x5

    const/4 v2, 0x1

    .line 259
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->add(II)V

    .line 261
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BookDayViewAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setCustomDayView(Lcom/flyersoft/views/BookCalendar/DayViewAdapter;)V

    .line 262
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->showCalendar(J)V

    .line 264
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$5;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->setOnDateSelectedListener(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$OnDateSelectedListener;)V

    return-void
.end method

.method private initStatistics()V
    .locals 9

    .line 153
    invoke-static {}, Lcom/flyersoft/tools/BookDb;->getAllStatistics()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->all:Ljava/util/ArrayList;

    .line 154
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

    .line 155
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 156
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    .line 158
    :try_start_0
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->text2StringList(Ljava/lang/String;Z)Ljava/util/ArrayList;

    move-result-object v2

    .line 159
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

    .line 160
    const-string v4, "|"

    invoke-virtual {v3, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    .line 161
    const-string v5, "@"

    invoke-virtual {v3, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    if-lez v4, :cond_1

    .line 163
    new-instance v6, Lcom/flyersoft/tools/BookDb$DayStatistics;

    invoke-direct {v6}, Lcom/flyersoft/tools/BookDb$DayStatistics;-><init>()V

    .line 164
    iget-object v7, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    iput-object v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    .line 165
    invoke-static {v3}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    iput-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->day:J

    add-int/lit8 v4, v4, 0x1

    .line 166
    invoke-virtual {v3, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v4

    int-to-long v7, v4

    iput-wide v7, v6, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    if-lez v5, :cond_2

    add-int/lit8 v5, v5, 0x1

    .line 167
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

    .line 168
    iget-object v3, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dayList:Ljava/util/ArrayList;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    .line 172
    invoke-static {v1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_3
    return-void
.end method

.method private initView()V
    .locals 3

    .line 84
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->rv:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    .line 85
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->date1:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->title:Landroid/widget/TextView;

    const/16 v0, 0x8

    .line 86
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setRvVisible(I)V

    .line 88
    invoke-static {}, Lcom/flyersoft/tools/C;->mainBackColor()I

    move-result v0

    .line 89
    invoke-static {}, Lcom/flyersoft/tools/A;->useAmoled()Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0x1e

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/flyersoft/tools/A;->isNightState()Z

    move-result v1

    if-eqz v1, :cond_1

    const/16 v1, 0xa

    goto :goto_0

    :cond_1
    const/16 v1, -0xa

    :goto_0
    invoke-static {v0, v1}, Lcom/flyersoft/tools/C;->furtherColor(II)I

    move-result v0

    .line 90
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 91
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v2, Lcom/flyersoft/moonreaderp/R$id;->rvBase:I

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 93
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->up:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$1;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->down:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$2;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$2;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 105
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->ok:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$3;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$3;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    sget v1, Lcom/flyersoft/moonreaderp/R$id;->menu:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$4;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 135
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initStatistics()V

    .line 136
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->fillStatistics()V

    return-void
.end method

.method private listBooks()V
    .locals 5

    .line 475
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$7;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$7;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 484
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lcom/flyersoft/moonreaderp/R$layout;->statistics_book:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    .line 485
    invoke-virtual {v0, v1, v1}, Landroid/view/View;->measure(II)V

    .line 486
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    iput v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->itemWidth:I

    .line 487
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->itemHeight:I

    .line 488
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->itemWidth:I

    int-to-float v0, v0

    invoke-static {v0}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->itemHeight:I

    int-to-float v2, v2

    invoke-static {v2}, Lcom/flyersoft/tools/A;->vd(F)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "item"

    aput-object v4, v3, v1

    const/4 v4, 0x1

    aput-object v0, v3, v4

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 489
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    iget v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->itemHeight:I

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->height:I

    .line 491
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    invoke-direct {v2, v3, v1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 492
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BooksRvAdapter;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$BooksRvAdapter;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method private saveFromDateBookToSelectedBooks(Lcom/flyersoft/tools/BookDb$DayStatistics;)V
    .locals 6

    .line 307
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 308
    iget-object v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    iget-object v3, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-nez v1, :cond_2

    .line 314
    new-instance v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    iget-object v1, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/flyersoft/tools/BookDb$ReadStatistics;-><init>(Ljava/lang/String;)V

    .line 315
    iget-wide v1, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    iput-wide v1, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    .line 316
    iget-wide v1, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->words:J

    iput-wide v1, v0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    .line 317
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 319
    :cond_2
    iget-wide v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    iget-wide v4, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    add-long/2addr v2, v4

    iput-wide v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    .line 320
    iget-wide v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    iget-wide v4, p1, Lcom/flyersoft/tools/BookDb$DayStatistics;->words:J

    add-long/2addr v2, v4

    iput-wide v2, v1, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWordsInDays:J

    return-void
.end method

.method private setDateSelecteEvent()V
    .locals 2

    .line 325
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->title:Landroid/widget/TextView;

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$6;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private showCalendar(J)V
    .locals 2

    .line 366
    iput-wide p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    const/16 p1, 0x8

    .line 367
    invoke-virtual {p0, p1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setRvVisible(I)V

    .line 368
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->calendar:Lcom/flyersoft/views/BookCalendar/CalendarPickerView;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthBegin:Ljava/util/Calendar;

    invoke-virtual {p2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->monthEnd:Ljava/util/Calendar;

    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView;->init(Ljava/util/Date;Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    .line 369
    sget-boolean p2, Lcom/flyersoft/tools/A;->callendarRangeMode:Z

    if-eqz p2, :cond_0

    sget-object p2, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->RANGE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    goto :goto_0

    .line 370
    :cond_0
    sget-object p2, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;->SINGLE:Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;

    .line 369
    :goto_0
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->inMode(Lcom/flyersoft/views/BookCalendar/CalendarPickerView$SelectionMode;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    move-result-object p1

    new-instance p2, Ljava/util/Date;

    iget-wide v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->start_time:J

    invoke-direct {p2, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 371
    invoke-virtual {p1, p2}, Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;->withSelectedDate(Ljava/util/Date;)Lcom/flyersoft/views/BookCalendar/CalendarPickerView$FluentInitializer;

    return-void
.end method

.method private speedText(FJZ)Ljava/lang/String;
    .locals 3

    .line 469
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    const-string v2, "0"

    cmpl-float v1, p1, v1

    if-lez v1, :cond_0

    new-instance v1, Ljava/text/DecimalFormat;

    invoke-direct {v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    long-to-float p2, p2

    div-float/2addr p2, p1

    float-to-double p1, p2

    invoke-virtual {v1, p1, p2}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v2

    :cond_0
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 470
    const-string p1, ""

    if-eqz p4, :cond_1

    const-string p2, "<small>"

    goto :goto_0

    :cond_1
    move-object p2, p1

    :goto_0
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/moonreaderp/ActivityMain;->getSpeedTagShort()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p4, :cond_2

    const-string p1, "</small>"

    :cond_2
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private timeText(FFZ)Ljava/lang/String;
    .locals 8

    const/high16 v0, 0x41200000    # 10.0f

    .line 460
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

    .line 461
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v2, "0.0"

    invoke-direct {v0, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 462
    :cond_1
    new-instance v0, Ljava/text/DecimalFormat;

    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v2, p2

    invoke-virtual {v0, v2, v3}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v0

    .line 463
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v3, 0x0

    cmpl-float v4, p2, v3

    if-lez v4, :cond_2

    float-to-double v4, p2

    const-wide v6, 0x3f847ae147ae147bL    # 0.01

    cmpg-double p2, v4, v6

    if-gez p2, :cond_2

    const-string v1, "0.01"

    goto :goto_1

    :cond_2
    cmpl-float p1, p1, v3

    if-lez p1, :cond_3

    move-object v1, v0

    :cond_3
    :goto_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 464
    sget-boolean p1, Lcom/flyersoft/tools/A;->isAsiaLanguage:Z

    const-string p2, ""

    if-eqz p1, :cond_4

    move-object p1, p2

    goto :goto_2

    :cond_4
    const-string p1, " "

    :goto_2
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_5

    .line 465
    const-string p1, "<small>"

    goto :goto_3

    :cond_5
    move-object p1, p2

    :goto_3
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->hours:I

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p3, :cond_6

    const-string p2, "</small>"

    :cond_6
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public dismiss()V
    .locals 0

    .line 639
    invoke-super {p0}, Landroid/app/Dialog;->dismiss()V

    return-void
.end method

.method getDateBook(J)Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;
    .locals 2

    .line 375
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    if-nez v0, :cond_0

    .line 377
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;-><init>(Lcom/flyersoft/moonreaderp/PrefBookCalendar;)V

    .line 378
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->dateBooks:Ljava/util/HashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method

.method public onBackPressed()V
    .locals 1

    .line 644
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0x8

    .line 645
    invoke-virtual {p0, v0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->setRvVisible(I)V

    return-void

    .line 648
    :cond_0
    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 65
    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    .line 67
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    .line 68
    invoke-static {}, Lcom/flyersoft/tools/A;->myOptionDialogWidth()I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v0, -0x1

    .line 69
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    const/16 v0, 0x11

    .line 71
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const v0, 0x3f4ccccd    # 0.8f

    .line 72
    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->dimAmount:F

    .line 73
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 74
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getWindow()Landroid/view/Window;

    move-result-object v0

    const/16 v1, 0x400

    invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V

    .line 75
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    .line 77
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->lay:Landroid/view/View;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->checkNightDialogState(Landroid/view/View;)Z

    .line 78
    invoke-direct {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->initView()V

    return-void
.end method

.method setRvVisible(I)V
    .locals 6

    .line 351
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->rv:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    const-wide/16 v0, 0x0

    if-nez p1, :cond_0

    .line 353
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/util/ArrayList;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 354
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->selectedBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-wide v2, v0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/flyersoft/tools/BookDb$ReadStatistics;

    .line 355
    iget-wide v4, v4, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTimeInDays:J

    add-long/2addr v2, v4

    goto :goto_0

    :cond_0
    move-wide v2, v0

    .line 356
    :cond_1
    const-string p1, "<b>"

    cmp-long v4, v2, v0

    if-lez v4, :cond_2

    long-to-float v0, v2

    const-wide/16 v1, 0x1

    .line 357
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->minute(J)J

    move-result-wide v3

    long-to-float v3, v3

    div-float v3, v0, v3

    .line 358
    invoke-static {v1, v2}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v1

    long-to-float v1, v1

    div-float/2addr v0, v1

    const/4 v1, 0x0

    .line 359
    invoke-direct {p0, v3, v0, v1}, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->timeText(FFZ)Ljava/lang/String;

    move-result-object v0

    .line 360
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->title:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->calendar:I

    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</b> <small>("

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")</small>"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 362
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->title:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar;->con:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->calendar:I

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "</b>"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
