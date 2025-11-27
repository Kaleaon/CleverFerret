.class public final Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;
.super Ljava/lang/Object;
.source "CharArrayBuffer.java"


# instance fields
.field private buffer:[C

.field private len:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-ltz p1, :cond_0

    .line 31
    new-array p1, p1, [C

    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    return-void

    .line 29
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Buffer capacity may not be negative"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private expand(I)V
    .locals 3

    .line 36
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    new-array p1, p1, [C

    .line 37
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    const/4 v1, 0x0

    iget v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    invoke-static {v0, v1, p1, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 38
    iput-object p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    return-void
.end method


# virtual methods
.method public append(C)V
    .locals 3

    .line 87
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    add-int/lit8 v0, v0, 0x1

    .line 88
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 89
    invoke-direct {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->expand(I)V

    .line 92
    :cond_0
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    aput-char p1, v1, v2

    .line 93
    iput v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void
.end method

.method public append(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 82
    iget-object v0, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    const/4 v1, 0x0

    iget p1, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    invoke-virtual {p0, v0, v1, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append([CII)V

    :cond_0
    return-void
.end method

.method public append(Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;II)V
    .locals 0

    if-eqz p1, :cond_0

    .line 76
    iget-object p1, p1, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    invoke-virtual {p0, p1, p2, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append([CII)V

    :cond_0
    return-void
.end method

.method public append(Ljava/lang/Object;)V
    .locals 0

    .line 128
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->append(Ljava/lang/String;)V

    return-void
.end method

.method public append(Ljava/lang/String;)V
    .locals 5

    if-nez p1, :cond_0

    .line 61
    const-string p1, "null"

    .line 64
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 65
    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    add-int/2addr v1, v0

    .line 66
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v2, v2

    if-le v1, v2, :cond_1

    .line 67
    invoke-direct {p0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->expand(I)V

    .line 70
    :cond_1
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    iget v3, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    const/4 v4, 0x0

    invoke-virtual {p1, v4, v0, v2, v3}, Ljava/lang/String;->getChars(II[CI)V

    .line 71
    iput v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void
.end method

.method public append([BII)V
    .locals 3

    if-eqz p1, :cond_3

    if-ltz p2, :cond_2

    .line 98
    array-length v0, p1

    if-gt p2, v0, :cond_2

    if-ltz p3, :cond_2

    add-int v0, p2, p3

    if-ltz v0, :cond_2

    array-length v1, p1

    if-gt v0, v1, :cond_2

    if-eqz p3, :cond_3

    .line 100
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    add-int/2addr p3, v0

    .line 102
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-le p3, v1, :cond_0

    .line 103
    invoke-direct {p0, p3}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->expand(I)V

    :cond_0
    :goto_0
    if-ge v0, p3, :cond_1

    .line 109
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    aget-byte v2, p1, p2

    and-int/lit16 v2, v2, 0xff

    int-to-char v2, v2

    aput-char v2, v1, v0

    add-int/lit8 p2, p2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    :cond_1
    iput p3, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void

    .line 116
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    :cond_3
    return-void
.end method

.method public append([CII)V
    .locals 3

    if-eqz p1, :cond_2

    if-ltz p2, :cond_1

    .line 43
    array-length v0, p1

    if-gt p2, v0, :cond_1

    if-ltz p3, :cond_1

    add-int v0, p2, p3

    if-ltz v0, :cond_1

    array-length v1, p1

    if-gt v0, v1, :cond_1

    if-eqz p3, :cond_2

    .line 45
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    add-int/2addr v0, p3

    .line 46
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-le v0, v1, :cond_0

    .line 47
    invoke-direct {p0, v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->expand(I)V

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    iget v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    invoke-static {p1, p2, v1, v2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 51
    iput v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void

    .line 54
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    :cond_2
    return-void
.end method

.method public buffer()[C
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    return-object v0
.end method

.method public capacity()I
    .locals 1

    .line 153
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    return v0
.end method

.method public charAt(I)C
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    aget-char p1, v0, p1

    return p1
.end method

.method public clear()V
    .locals 1

    const/4 v0, 0x0

    .line 132
    iput v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void
.end method

.method public ensureCapacity(I)V
    .locals 2

    if-lez p1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    sub-int/2addr v0, v1

    if-le p1, v0, :cond_0

    add-int/2addr v1, p1

    .line 164
    invoke-direct {p0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->expand(I)V

    :cond_0
    return-void
.end method

.method public indexOf(I)I
    .locals 2

    const/4 v0, 0x0

    .line 209
    iget v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    invoke-virtual {p0, p1, v0, v1}, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->indexOf(III)I

    move-result p1

    return p1
.end method

.method public indexOf(III)I
    .locals 2

    if-gez p2, :cond_0

    const/4 p2, 0x0

    .line 191
    :cond_0
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    if-le p3, v0, :cond_1

    move p3, v0

    :cond_1
    const/4 v0, -0x1

    if-le p2, p3, :cond_2

    return v0

    :cond_2
    :goto_0
    if-ge p2, p3, :cond_4

    .line 199
    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    aget-char v1, v1, p2

    if-ne v1, p1, :cond_3

    return p2

    :cond_3
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .line 179
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isFull()Z
    .locals 2

    .line 183
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v1, v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public length()I
    .locals 1

    .line 157
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return v0
.end method

.method public setLength(I)V
    .locals 1

    if-ltz p1, :cond_0

    .line 171
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    array-length v0, v0

    if-gt p1, v0, :cond_0

    .line 172
    iput p1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    return-void

    .line 174
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public substring(II)Ljava/lang/String;
    .locals 2

    if-ltz p1, :cond_2

    .line 215
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    if-gt p2, v0, :cond_1

    if-gt p1, p2, :cond_0

    .line 220
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    sub-int/2addr p2, p1

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 218
    :cond_0
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 216
    :cond_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 214
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public substringTrimmed(II)Ljava/lang/String;
    .locals 2

    if-ltz p1, :cond_4

    .line 227
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    if-gt p2, v0, :cond_3

    if-gt p1, p2, :cond_2

    :goto_0
    if-ge p1, p2, :cond_0

    .line 232
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    aget-char v0, v0, p1

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HTTP;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_0

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    if-le p2, p1, :cond_1

    .line 236
    iget-object v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    add-int/lit8 v1, p2, -0x1

    aget-char v0, v0, v1

    invoke-static {v0}, Lcom/burgstaller/okhttp/digest/fromhttpclient/HTTP;->isWhitespace(C)Z

    move-result v0

    if-eqz v0, :cond_1

    add-int/lit8 p2, p2, -0x1

    goto :goto_1

    .line 240
    :cond_1
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    sub-int/2addr p2, p1

    invoke-direct {v0, v1, p1, p2}, Ljava/lang/String;-><init>([CII)V

    return-object v0

    .line 230
    :cond_2
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 228
    :cond_3
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 226
    :cond_4
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1
.end method

.method public toCharArray()[C
    .locals 4

    .line 136
    iget v0, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    new-array v1, v0, [C

    if-lez v0, :cond_0

    .line 138
    iget-object v2, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    const/4 v3, 0x0

    invoke-static {v2, v3, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 245
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/burgstaller/okhttp/digest/fromhttpclient/CharArrayBuffer;->len:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
