.class Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;
.super Ljava/lang/Object;
.source "PrefBookCalendar.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefBookCalendar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "DateBook"
.end annotation


# instance fields
.field books:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$DayStatistics;",
            ">;"
        }
    .end annotation
.end field

.field dayHourProgress:I

.field private primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

.field private second:Lcom/flyersoft/tools/BookDb$DayStatistics;

.field private third:Lcom/flyersoft/tools/BookDb$DayStatistics;

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

    .line 178
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->this$0:Lcom/flyersoft/moonreaderp/PrefBookCalendar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 179
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    const/4 p1, -0x1

    .line 209
    iput p1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->dayHourProgress:I

    return-void
.end method


# virtual methods
.method getDayHourProgress()I
    .locals 4

    .line 211
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->dayHourProgress:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 213
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 214
    iget-wide v2, v2, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    long-to-float v2, v2

    add-float/2addr v1, v2

    goto :goto_0

    :cond_0
    const-wide/16 v2, 0x1

    .line 215
    invoke-static {v2, v3}, Lcom/flyersoft/tools/T;->hour(J)J

    move-result-wide v2

    long-to-float v0, v2

    div-float/2addr v1, v0

    const/high16 v0, 0x41200000    # 10.0f

    cmpl-float v2, v1, v0

    if-ltz v2, :cond_1

    const/16 v0, 0x64

    goto :goto_1

    :cond_1
    mul-float v1, v1, v0

    float-to-int v0, v1

    .line 216
    :goto_1
    iput v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->dayHourProgress:I

    .line 218
    :cond_2
    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->dayHourProgress:I

    return v0
.end method

.method getPrimary()Lcom/flyersoft/tools/BookDb$DayStatistics;
    .locals 7

    .line 182
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_2

    .line 183
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 184
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eqz v2, :cond_1

    iget-wide v2, v2, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    iget-wide v4, v1, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    .line 185
    :cond_1
    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    goto :goto_0

    .line 187
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    return-object v0
.end method

.method getSecond()Lcom/flyersoft/tools/BookDb$DayStatistics;
    .locals 7

    .line 190
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->second:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 191
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getPrimary()Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 192
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 193
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eq v2, v1, :cond_0

    .line 194
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->second:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eqz v2, :cond_1

    iget-wide v2, v2, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    iget-wide v4, v1, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    .line 195
    :cond_1
    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->second:Lcom/flyersoft/tools/BookDb$DayStatistics;

    goto :goto_0

    .line 197
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->second:Lcom/flyersoft/tools/BookDb$DayStatistics;

    return-object v0
.end method

.method getThird()Lcom/flyersoft/tools/BookDb$DayStatistics;
    .locals 7

    .line 200
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->third:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    .line 201
    invoke-virtual {p0}, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->getSecond()Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 202
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->books:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/tools/BookDb$DayStatistics;

    .line 203
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->primary:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eq v2, v1, :cond_0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->second:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eq v2, v1, :cond_0

    .line 204
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->third:Lcom/flyersoft/tools/BookDb$DayStatistics;

    if-eqz v2, :cond_1

    iget-wide v2, v2, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    iget-wide v4, v1, Lcom/flyersoft/tools/BookDb$DayStatistics;->time:J

    cmp-long v6, v2, v4

    if-gez v6, :cond_0

    .line 205
    :cond_1
    iput-object v1, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->third:Lcom/flyersoft/tools/BookDb$DayStatistics;

    goto :goto_0

    .line 207
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefBookCalendar$DateBook;->third:Lcom/flyersoft/tools/BookDb$DayStatistics;

    return-object v0
.end method
