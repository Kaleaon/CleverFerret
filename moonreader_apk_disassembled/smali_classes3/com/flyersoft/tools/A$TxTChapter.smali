.class public Lcom/flyersoft/tools/A$TxTChapter;
.super Ljava/lang/Object;
.source "A.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/tools/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TxTChapter"
.end annotation


# instance fields
.field public chapter:Ljava/lang/String;

.field public chapterId:I

.field public chapter_trim:Ljava/lang/String;

.field public displayPos:J

.field public indentAtFirst:Z

.field public position:J

.field public puncAtEnd:Z


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2

    .line 4581
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 4587
    iput-wide v0, p0, Lcom/flyersoft/tools/A$TxTChapter;->displayPos:J

    const/4 v0, -0x1

    .line 4588
    iput v0, p0, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    .line 4582
    invoke-static {p1}, Lcom/flyersoft/tools/A;->-$$Nest$smtrimChapterTitle2(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/tools/A$TxTChapter;->chapter_trim:Ljava/lang/String;

    .line 4583
    iput-object p2, p0, Lcom/flyersoft/tools/A$TxTChapter;->chapter:Ljava/lang/String;

    .line 4584
    iput-wide p3, p0, Lcom/flyersoft/tools/A$TxTChapter;->position:J

    return-void
.end method


# virtual methods
.method public getDisplayPosition(I)J
    .locals 11

    .line 4590
    iget-wide v0, p0, Lcom/flyersoft/tools/A$TxTChapter;->displayPos:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    :cond_0
    if-ltz p1, :cond_8

    .line 4592
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-le p1, v0, :cond_1

    goto/16 :goto_1

    .line 4594
    :cond_1
    iput p1, p0, Lcom/flyersoft/tools/A$TxTChapter;->chapterId:I

    .line 4595
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flyersoft/tools/A$TxTChapter;

    iget-wide v0, v0, Lcom/flyersoft/tools/A$TxTChapter;->position:J

    .line 4596
    sget v2, Lcom/flyersoft/tools/A;->fixedBlockLength:I

    int-to-long v2, v2

    div-long v2, v0, v2

    long-to-int v3, v2

    .line 4597
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxtChapters()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/A$TxTChapter;

    iget-object p1, p1, Lcom/flyersoft/tools/A$TxTChapter;->chapter:Ljava/lang/String;

    .line 4598
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getTxtDisplayText(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 4599
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v2

    .line 4600
    invoke-virtual {v2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_3

    .line 4601
    invoke-static {}, Lcom/flyersoft/tools/A;->getTxts()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v3, v6, :cond_3

    .line 4602
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v6, v3, 0x1

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getTxts2(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 4603
    invoke-virtual {v4, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    if-eq v6, v5, :cond_2

    move-object v2, v4

    :cond_2
    move v4, v6

    :cond_3
    if-eq v4, v5, :cond_4

    .line 4608
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v6

    add-int/2addr v6, v4

    invoke-virtual {v2, p1, v6}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v5, :cond_4

    int-to-long v7, v6

    sub-long v7, v0, v7

    .line 4609
    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v7

    int-to-long v9, v4

    sub-long/2addr v0, v9

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    cmp-long v9, v7, v0

    if-gez v9, :cond_4

    move v4, v6

    :cond_4
    if-ne v4, v5, :cond_5

    .line 4612
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x14

    if-le v0, v1, :cond_5

    const/4 v0, 0x0

    .line 4613
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    :cond_5
    if-ne v4, v5, :cond_6

    .line 4615
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1

    add-int/lit8 v4, p1, -0x64

    :cond_6
    if-lez v3, :cond_7

    .line 4616
    invoke-static {v3}, Lcom/flyersoft/tools/A;->getPriorTxtLength(I)I

    move-result p1

    add-int/2addr p1, v4

    int-to-long v0, p1

    goto :goto_0

    :cond_7
    int-to-long v0, v4

    :goto_0
    iput-wide v0, p0, Lcom/flyersoft/tools/A$TxTChapter;->displayPos:J

    return-wide v0

    :cond_8
    :goto_1
    const-wide/16 v0, 0x0

    return-wide v0
.end method
