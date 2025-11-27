.class public Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;
.super Ljava/lang/Object;
.source "ParserCursor.java"


# instance fields
.field private final lowerBound:I

.field private pos:I

.field private final upperBound:I


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_1

    if-gt p1, p2, :cond_0

    .line 33
    iput p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->lowerBound:I

    .line 34
    iput p2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->upperBound:I

    .line 35
    iput p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->pos:I

    return-void

    .line 31
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string p2, "Lower bound cannot be greater then upper bound"

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 29
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    const-string p2, "Lower bound cannot be negative"

    invoke-direct {p1, p2}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public atEnd()Z
    .locals 2

    .line 62
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->pos:I

    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->upperBound:I

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getLowerBound()I
    .locals 1

    .line 40
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->lowerBound:I

    return v0
.end method

.method public getPos()I
    .locals 1

    .line 48
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->pos:I

    return v0
.end method

.method public getUpperBound()I
    .locals 1

    .line 44
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->upperBound:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x10

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/16 v1, 0x5b

    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->lowerBound:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x3e

    .line 69
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    iget v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->pos:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 72
    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->upperBound:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const/16 v1, 0x5d

    .line 73
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public updatePos(I)V
    .locals 1

    .line 52
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->lowerBound:I

    if-lt p1, v0, :cond_1

    .line 54
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->upperBound:I

    if-gt p1, v0, :cond_0

    .line 57
    iput p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/ParserCursor;->pos:I

    return-void

    .line 55
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 53
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method
