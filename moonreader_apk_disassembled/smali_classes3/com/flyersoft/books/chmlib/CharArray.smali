.class public Lcom/flyersoft/books/chmlib/CharArray;
.super Ljava/lang/Object;
.source "CharArray.java"


# instance fields
.field public buffer:[C

.field public len:I


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x400

    .line 14
    invoke-direct {p0, v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-array p1, p1, [C

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    return-void
.end method


# virtual methods
.method public a(C)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 3

    .line 70
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    aput-char p1, v0, v1

    return-object p0
.end method

.method public a(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 4

    const/4 v0, 0x0

    .line 64
    :goto_0
    iget v1, p1, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v1, :cond_0

    .line 65
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    iget-object v3, p1, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v3, v3, v0

    aput-char v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 4

    const/4 v0, 0x0

    .line 56
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 57
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    add-int/lit8 v3, v2, 0x1

    iput v3, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    aput-char v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public append(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 0

    .line 61
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/CharArray;->a(Lcom/flyersoft/books/chmlib/CharArray;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p1

    return-object p1
.end method

.method public append(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 0

    .line 54
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p1

    return-object p1
.end method

.method public append(I)V
    .locals 3

    .line 18
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    int-to-char p1, p1

    aput-char p1, v0, v1

    return-void
.end method

.method public clear()Lcom/flyersoft/books/chmlib/CharArray;
    .locals 1

    const/4 v0, 0x0

    .line 16
    iput v0, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    return-object p0
.end method

.method public convertFrom(I)V
    .locals 0

    return-void
.end method

.method public copyFrom(Lcom/flyersoft/books/chmlib/CharArray;)V
    .locals 3

    .line 40
    iget v0, p1, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    iput v0, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    const/4 v0, 0x0

    .line 41
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    iget-object v2, p1, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v2, v2, v0

    aput-char v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public equals(Ljava/lang/String;)Z
    .locals 4

    .line 31
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    return v2

    :cond_0
    const/4 v0, 0x0

    .line 33
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v1, :cond_2

    .line 34
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v1, v1, v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-eq v1, v3, :cond_1

    return v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x1

    return p1
.end method

.method public hashCode()I
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 48
    :goto_0
    iget v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v2, :cond_0

    shl-int/lit8 v2, v1, 0x5

    sub-int/2addr v2, v1

    .line 49
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v1, v1, v0

    add-int/2addr v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return v1
.end method

.method public indexOf(C)I
    .locals 2

    const/4 v0, 0x0

    .line 80
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v1, :cond_1

    .line 81
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v1, v1, v0

    if-ne v1, p1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public indexOf(Ljava/lang/String;)I
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 88
    :goto_0
    iget v2, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    if-ge v1, v2, :cond_3

    const/4 v2, 0x0

    .line 90
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    .line 91
    iget-object v3, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    add-int v4, v1, v2

    aget-char v3, v3, v4

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-eq v3, v4, :cond_0

    goto :goto_2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 94
    :cond_1
    :goto_2
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ne v2, v3, :cond_2

    return v1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    const/4 p1, -0x1

    return p1
.end method

.method public replace(Ljava/lang/String;Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;
    .locals 2

    .line 101
    invoke-virtual {p0, p1}, Lcom/flyersoft/books/chmlib/CharArray;->indexOf(Ljava/lang/String;)I

    move-result v0

    if-gez v0, :cond_0

    return-object p0

    .line 103
    :cond_0
    new-instance v0, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {v0}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/CharArray;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/flyersoft/books/chmlib/CharArray;->a(Ljava/lang/String;)Lcom/flyersoft/books/chmlib/CharArray;

    move-result-object p1

    return-object p1
.end method

.method public setLength(I)V
    .locals 0

    .line 17
    iput p1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    return-void
.end method

.method public toLowerCase()V
    .locals 4

    const/4 v0, 0x0

    .line 22
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    if-ge v0, v1, :cond_1

    .line 23
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    aget-char v2, v1, v0

    const/16 v3, 0x41

    if-lt v2, v3, :cond_0

    const/16 v3, 0x5a

    if-gt v2, v3, :cond_0

    add-int/lit8 v2, v2, 0x20

    int-to-char v2, v2

    .line 25
    aput-char v2, v1, v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 19
    new-instance v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharArray;->buffer:[C

    const/4 v2, 0x0

    iget v3, p0, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    invoke-direct {v0, v1, v2, v3}, Ljava/lang/String;-><init>([CII)V

    return-object v0
.end method
