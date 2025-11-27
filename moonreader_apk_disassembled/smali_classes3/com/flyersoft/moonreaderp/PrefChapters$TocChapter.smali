.class public Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;
.super Ljava/lang/Object;
.source "PrefChapters.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TocChapter"
.end annotation


# instance fields
.field public expanded:Z

.field public hasSubChapter:Z

.field public indent:I

.field public index:I

.field public lowerCaseName:Ljava/lang/String;

.field public name:Ljava/lang/String;

.field public pageNumber:I


# direct methods
.method public constructor <init>(Ljava/lang/String;IIZZI)V
    .locals 0

    .line 466
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 467
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->name:Ljava/lang/String;

    .line 468
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->lowerCaseName:Ljava/lang/String;

    .line 469
    iput p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->index:I

    .line 470
    iput p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->indent:I

    .line 471
    iput-boolean p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->hasSubChapter:Z

    .line 472
    iput-boolean p5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->expanded:Z

    .line 473
    iput p6, p0, Lcom/flyersoft/moonreaderp/PrefChapters$TocChapter;->pageNumber:I

    return-void
.end method
