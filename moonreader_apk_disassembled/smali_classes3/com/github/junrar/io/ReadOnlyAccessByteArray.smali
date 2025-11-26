.class public Lcom/github/junrar/io/ReadOnlyAccessByteArray;
.super Ljava/lang/Object;
.source "ReadOnlyAccessByteArray.java"

# interfaces
.implements Lcom/github/junrar/io/IReadOnlyAccess;


# instance fields
.field private file:[B

.field private positionInFile:I


# direct methods
.method public constructor <init>([B)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 43
    iput-object p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    const/4 p1, 0x0

    .line 44
    iput p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    return-void

    .line 41
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "file must not be null!!"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public getPosition()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    iget v1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    aget-byte v0, v0, v1

    return v0
.end method

.method public read([BII)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    array-length v0, v0

    iget v1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    sub-int/2addr v0, v1

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 69
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    iget v1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    invoke-static {v0, v1, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 70
    iget p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    add-int/2addr p1, p3

    iput p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    return p3
.end method

.method public readFully([BI)I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    .line 81
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    array-length v0, v0

    iget v1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    sub-int/2addr v0, v1

    add-int/lit8 v0, v0, -0x1

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 82
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    iget v1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    const/4 v2, 0x0

    invoke-static {v0, v1, p1, v2, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 83
    iget p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    return p2

    .line 79
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "cannot read 0 bytes ;-)"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 76
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "buffer must not be null"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setPosition(J)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->file:[B

    array-length v0, v0

    int-to-long v0, v0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_0

    long-to-int p2, p1

    .line 53
    iput p2, p0, Lcom/github/junrar/io/ReadOnlyAccessByteArray;->positionInFile:I

    return-void

    .line 55
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1
.end method
