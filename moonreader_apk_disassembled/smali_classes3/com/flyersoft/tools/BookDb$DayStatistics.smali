.class public Lcom/flyersoft/tools/BookDb$DayStatistics;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DayStatistics"
.end annotation


# instance fields
.field private bi:Lcom/flyersoft/tools/BookDb$BookInfo;

.field public day:J

.field public filename:Ljava/lang/String;

.field public time:J

.field public words:J


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 165
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getBi()Lcom/flyersoft/tools/BookDb$BookInfo;
    .locals 1

    .line 170
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$DayStatistics;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    if-nez v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$DayStatistics;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/BookDb;->getBookFromAll(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/flyersoft/tools/BookDb$DayStatistics;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 172
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/tools/BookDb$DayStatistics;->bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    return-object v0
.end method
