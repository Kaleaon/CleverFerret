.class Lcom/rtfparserkit/parser/raw/ByteBuffer;
.super Ljava/lang/Object;
.source "ByteBuffer.java"


# static fields
.field private static final INITIAL_BUFFER_CAPACITY:I = 0x2800


# instance fields
.field private buffer:[B

.field private bufferSize:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x2800

    .line 75
    new-array v0, v0, [B

    iput-object v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 4

    .line 31
    iget v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    iget-object v1, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    array-length v2, v1

    if-ne v0, v2, :cond_0

    .line 33
    array-length v2, v1

    array-length v3, v1

    shr-int/lit8 v3, v3, 0x1

    add-int/2addr v2, v3

    new-array v2, v2, [B

    const/4 v3, 0x0

    .line 34
    invoke-static {v1, v3, v2, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    iput-object v2, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    .line 38
    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    iget v1, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    int-to-byte p1, p1

    aput-byte p1, v0, v1

    return-void
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 46
    iput v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    return-void
.end method

.method public isEmpty()Z
    .locals 1

    .line 64
    iget v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toArray()[B
    .locals 4

    .line 54
    iget v0, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    new-array v1, v0, [B

    .line 55
    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 70
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[ByteBuffer bufferSize="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " buffer="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v1, Ljava/lang/String;

    iget-object v2, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->buffer:[B

    const/4 v3, 0x0

    iget v4, p0, Lcom/rtfparserkit/parser/raw/ByteBuffer;->bufferSize:I

    invoke-direct {v1, v2, v3, v4}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
