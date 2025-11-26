.class public Lcom/flyersoft/tools/BookDb$ReadStatistics;
.super Ljava/lang/Object;
.source "BookDb.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/BookDb;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReadStatistics"
.end annotation


# instance fields
.field public dates:Ljava/lang/String;

.field public dayList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/flyersoft/tools/BookDb$DayStatistics;",
            ">;"
        }
    .end annotation
.end field

.field public filename:Ljava/lang/String;

.field public readWords:J

.field public readWordsInDays:J

.field public speed:F

.field public usedTime:J

.field public usedTimeInDays:J


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 185
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 186
    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;JJLjava/lang/String;)V
    .locals 0

    .line 188
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 189
    iput-object p1, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->filename:Ljava/lang/String;

    .line 190
    iput-wide p2, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->usedTime:J

    .line 191
    iput-wide p4, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->readWords:J

    .line 192
    iput-object p6, p0, Lcom/flyersoft/tools/BookDb$ReadStatistics;->dates:Ljava/lang/String;

    return-void
.end method
