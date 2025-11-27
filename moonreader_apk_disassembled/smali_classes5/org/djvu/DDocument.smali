.class public Lorg/djvu/DDocument;
.super Ljava/lang/Object;
.source "DDocument.java"


# static fields
.field public static inited:Z

.field public static outOfMemory:Z


# instance fields
.field public _context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

.field public _doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

.field max:[F

.field private pageCount:I

.field public pageInfo:[Lorg/mydroid/core/codec/DjvuPageInfo;

.field public pages:[Lorg/djvu/DPage;

.field startTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Lorg/djvu/DDocument;->_context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    .line 25
    iput-object v0, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    const/4 v0, 0x0

    .line 84
    iput v0, p0, Lorg/djvu/DDocument;->pageCount:I

    .line 17
    sput-boolean v0, Lorg/djvu/DDocument;->outOfMemory:Z

    .line 18
    sget-boolean v0, Lorg/djvu/DDocument;->inited:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 19
    sput-boolean v0, Lorg/djvu/DDocument;->inited:Z

    .line 20
    const-string v0, "mydjvu"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public Close()V
    .locals 2

    .line 67
    iget-object v0, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 68
    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->freeDocument()V

    .line 69
    iput-object v1, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    .line 72
    :cond_0
    iget-object v0, p0, Lorg/djvu/DDocument;->_context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    if-eqz v0, :cond_1

    .line 73
    invoke-virtual {v0}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->recycle()V

    .line 74
    iput-object v1, p0, Lorg/djvu/DDocument;->_context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    :cond_1
    return-void
.end method

.method public GetPage(I)Lorg/djvu/DPage;
    .locals 2

    .line 79
    iget-object v0, p0, Lorg/djvu/DDocument;->pages:[Lorg/djvu/DPage;

    aget-object v1, v0, p1

    if-nez v1, :cond_0

    .line 80
    new-instance v1, Lorg/djvu/DPage;

    invoke-direct {v1, p0, p1}, Lorg/djvu/DPage;-><init>(Lorg/djvu/DDocument;I)V

    aput-object v1, v0, p1

    .line 81
    :cond_0
    iget-object v0, p0, Lorg/djvu/DDocument;->pages:[Lorg/djvu/DPage;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public GetPageCount()I
    .locals 1

    .line 87
    iget v0, p0, Lorg/djvu/DDocument;->pageCount:I

    return v0
.end method

.method public GetPageHeight(I)I
    .locals 0

    .line 97
    invoke-virtual {p0, p1}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object p1

    iget p1, p1, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    return p1
.end method

.method public GetPageWidth(I)I
    .locals 0

    .line 92
    invoke-virtual {p0, p1}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object p1

    iget p1, p1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    return p1
.end method

.method public GetPagesMaxSize(I)[F
    .locals 7

    .line 111
    iget-object v0, p0, Lorg/djvu/DDocument;->max:[F

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    .line 114
    invoke-virtual {p0, v0}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x1

    .line 115
    :goto_0
    iget v4, p0, Lorg/djvu/DDocument;->pageCount:I

    if-ge v3, v4, :cond_2

    .line 116
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v4, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    if-le v4, v5, :cond_1

    .line 117
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v1

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 119
    :goto_1
    iget v4, p0, Lorg/djvu/DDocument;->pageCount:I

    if-ge v3, v4, :cond_5

    if-ne p1, v2, :cond_3

    .line 121
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v4, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    if-eq v4, v5, :cond_4

    .line 122
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v6

    iget v6, v6, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    mul-int v5, v5, v6

    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v6

    iget v6, v6, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    div-int/2addr v5, v6

    iput v5, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    .line 123
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    iput v5, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    goto :goto_2

    .line 126
    :cond_3
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v4, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    if-ge v4, v5, :cond_4

    .line 127
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v6

    iget v6, v6, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    mul-int v5, v5, v6

    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v6

    iget v6, v6, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    div-int/2addr v5, v6

    iput v5, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    .line 128
    invoke-virtual {p0, v3}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v4

    iget v5, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    iput v5, v4, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    :cond_4
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 143
    :cond_5
    iget p1, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    int-to-float p1, p1

    iget v1, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    int-to-float v1, v1

    const/4 v3, 0x2

    new-array v3, v3, [F

    aput p1, v3, v0

    aput v1, v3, v2

    iput-object v3, p0, Lorg/djvu/DDocument;->max:[F

    .line 144
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "djvu load time2: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lorg/djvu/DDocument;->startTime:J

    sub-long/2addr v3, v5

    invoke-virtual {p1, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v0

    invoke-static {v1}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 145
    iget-object p1, p0, Lorg/djvu/DDocument;->max:[F

    return-object p1
.end method

.method public Open(Ljava/lang/String;Landroid/os/Handler;I)Ljava/lang/String;
    .locals 9

    .line 32
    new-instance v0, Lorg/mydroid/droids/djvu/codec/DjvuContext;

    invoke-direct {v0}, Lorg/mydroid/droids/djvu/codec/DjvuContext;-><init>()V

    iput-object v0, p0, Lorg/djvu/DDocument;->_context:Lorg/mydroid/droids/djvu/codec/DjvuContext;

    .line 33
    invoke-virtual {v0, p1}, Lorg/mydroid/droids/djvu/codec/DjvuContext;->openDocument(Ljava/lang/String;)Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    move-result-object p1

    iput-object p1, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    .line 34
    iget-object p1, p1, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->err:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 35
    iget-object p1, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    iget-object p1, p1, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->err:Ljava/lang/String;

    return-object p1

    .line 38
    :cond_0
    :try_start_0
    iget-object p1, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    invoke-virtual {p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPageCount()I

    move-result p1

    iput p1, p0, Lorg/djvu/DDocument;->pageCount:I

    .line 39
    new-array v0, p1, [Lorg/mydroid/core/codec/DjvuPageInfo;

    iput-object v0, p0, Lorg/djvu/DDocument;->pageInfo:[Lorg/mydroid/core/codec/DjvuPageInfo;

    .line 40
    new-array p1, p1, [Lorg/djvu/DPage;

    iput-object p1, p0, Lorg/djvu/DDocument;->pages:[Lorg/djvu/DPage;

    .line 42
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/djvu/DDocument;->startTime:J

    if-eqz p2, :cond_6

    const/4 p1, 0x0

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 46
    :goto_0
    iget v4, p0, Lorg/djvu/DDocument;->pageCount:I

    const/4 v5, 0x1

    if-ge v2, v4, :cond_5

    .line 47
    invoke-virtual {p0, v2}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    if-nez v3, :cond_2

    .line 49
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v6, p0, Lorg/djvu/DDocument;->startTime:J

    sub-long/2addr v3, v6

    const-wide/16 v6, 0x3e8

    cmp-long v8, v3, v6

    if-lez v8, :cond_1

    iget v3, p0, Lorg/djvu/DDocument;->pageCount:I

    div-int/lit8 v3, v3, 0x2

    if-ge v2, v3, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :cond_2
    :goto_1
    if-eqz v3, :cond_4

    .line 51
    iget v4, p0, Lorg/djvu/DDocument;->pageCount:I

    add-int/lit8 v4, v4, -0x2

    if-ge v2, v4, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    const-wide/16 v6, 0x190

    cmp-long v8, v4, v6

    if-lez v8, :cond_4

    :cond_3
    add-int/lit8 v0, v2, 0x1

    .line 52
    iget v1, p0, Lorg/djvu/DDocument;->pageCount:I

    invoke-virtual {p2, p3, v0, v1}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 56
    :cond_5
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "djvu load time: "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/djvu/DDocument;->startTime:J

    sub-long/2addr v0, v2

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    new-array p3, v5, [Ljava/lang/Object;

    aput-object p2, p3, p1

    invoke-static {p3}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_6
    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception p1

    .line 59
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 60
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public d(F)I
    .locals 1

    .line 149
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method

.method public getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;
    .locals 2

    .line 101
    iget-object v0, p0, Lorg/djvu/DDocument;->pageInfo:[Lorg/mydroid/core/codec/DjvuPageInfo;

    aget-object v0, v0, p1

    if-nez v0, :cond_0

    .line 103
    iget-object v0, p0, Lorg/djvu/DDocument;->_doc:Lorg/mydroid/droids/djvu/codec/DjvuDocument;

    invoke-virtual {v0, p1}, Lorg/mydroid/droids/djvu/codec/DjvuDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v0

    .line 104
    iget-object v1, p0, Lorg/djvu/DDocument;->pageInfo:[Lorg/mydroid/core/codec/DjvuPageInfo;

    aput-object v0, v1, p1

    :cond_0
    return-object v0
.end method

.method public getPageX(I)I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 163
    invoke-virtual {p0, v0}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public getPageXRtl(I)I
    .locals 2

    add-int/lit8 p1, p1, 0x1

    const/4 v0, 0x0

    .line 170
    :goto_0
    iget v1, p0, Lorg/djvu/DDocument;->pageCount:I

    if-ge p1, v1, :cond_0

    .line 171
    invoke-virtual {p0, p1}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v1

    iget v1, v1, Lorg/mydroid/core/codec/DjvuPageInfo;->width:I

    add-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return v0
.end method

.method public getPageY(I)I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v0, p1, :cond_0

    .line 155
    invoke-virtual {p0, v0}, Lorg/djvu/DDocument;->getPageInfo(I)Lorg/mydroid/core/codec/DjvuPageInfo;

    move-result-object v2

    iget v2, v2, Lorg/mydroid/core/codec/DjvuPageInfo;->height:I

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method
