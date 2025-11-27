.class public Lcom/dozof/app/mobi/MobiTextStream;
.super Ljava/io/InputStream;
.source "MobiTextStream.java"

# interfaces
.implements Ljava/lang/AutoCloseable;


# static fields
.field private static final TAG:Ljava/lang/String; = "com.dozof.app.mobi.MobiTextStream"


# instance fields
.field protected buffer:[B

.field protected bufferLength:I

.field protected bufferOffset:I

.field protected decoder:Lcom/dozof/app/mobi/MobiDecoder;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/dozof/app/mobi/MobiDecoder;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/16 v0, 0x2000

    .line 13
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferLength:I

    .line 20
    iput v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    .line 22
    iput-object p1, p0, Lcom/dozof/app/mobi/MobiTextStream;->decoder:Lcom/dozof/app/mobi/MobiDecoder;

    .line 23
    invoke-virtual {p1}, Lcom/dozof/app/mobi/MobiDecoder;->prepareTextRead()Z

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 56
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 57
    iput-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    :cond_0
    return-void
.end method

.method protected fillBuffer()Z
    .locals 5

    .line 70
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 74
    :cond_0
    iget v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    iget v3, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferLength:I

    const/4 v4, 0x1

    if-eq v2, v3, :cond_1

    return v4

    .line 78
    :cond_1
    iget-object v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->decoder:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v2, v0}, Lcom/dozof/app/mobi/MobiDecoder;->readText([B)I

    move-result v0

    iput v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferLength:I

    if-lez v0, :cond_2

    .line 82
    iput v1, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    return v4

    :cond_2
    const/4 v0, 0x0

    .line 86
    iput-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    return v1
.end method

.method public read()I
    .locals 3

    .line 33
    invoke-virtual {p0}, Lcom/dozof/app/mobi/MobiTextStream;->fillBuffer()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    return v0

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    iget v1, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public read([BII)I
    .locals 5

    const/4 v0, 0x0

    :cond_0
    :goto_0
    if-ge v0, p3, :cond_2

    .line 42
    invoke-virtual {p0}, Lcom/dozof/app/mobi/MobiTextStream;->fillBuffer()Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_1

    :cond_1
    sub-int v1, p3, v0

    .line 45
    iget v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferLength:I

    iget v3, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    if-lez v1, :cond_0

    .line 47
    iget-object v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->buffer:[B

    iget v3, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    add-int v4, p2, v0

    invoke-static {v2, v3, p1, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/2addr v0, v1

    .line 49
    iget v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    add-int/2addr v2, v1

    iput v2, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    goto :goto_0

    :cond_2
    :goto_1
    if-lez v0, :cond_3

    return v0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public resetBuffer()V
    .locals 1

    const/4 v0, 0x0

    .line 27
    iput v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferLength:I

    .line 28
    iput v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->bufferOffset:I

    .line 29
    iget-object v0, p0, Lcom/dozof/app/mobi/MobiTextStream;->decoder:Lcom/dozof/app/mobi/MobiDecoder;

    invoke-virtual {v0}, Lcom/dozof/app/mobi/MobiDecoder;->prepareTextRead()Z

    return-void
.end method

.method public skip(I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-lez p1, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 63
    invoke-virtual {p0, v0, v1, p1}, Lcom/dozof/app/mobi/MobiTextStream;->read([BII)I

    return-void

    .line 65
    :cond_0
    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "cannot skip "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
