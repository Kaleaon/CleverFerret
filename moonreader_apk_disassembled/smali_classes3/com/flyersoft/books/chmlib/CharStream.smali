.class public Lcom/flyersoft/books/chmlib/CharStream;
.super Ljava/lang/Object;
.source "CharStream.java"


# instance fields
.field public buffer:Ljava/lang/String;

.field private pos:I

.field private spaceChars:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const-string v0, " \n\r\t"

    iput-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->spaceChars:Ljava/lang/String;

    .line 15
    iput-object p1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public hasMore()Z
    .locals 2

    .line 99
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public peak()C
    .locals 2

    .line 19
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public peak(I)C
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 22
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/2addr v0, p1

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 24
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/2addr v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    return p1
.end method

.method public read()C
    .locals 3

    .line 18
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0
.end method

.method public read(Ljava/lang/StringBuilder;I)V
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {p1, v0, v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;II)Ljava/lang/StringBuilder;

    return-void
.end method

.method public readUntil(C)Ljava/lang/String;
    .locals 3

    .line 88
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    .line 89
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 90
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne p1, v1, :cond_0

    goto :goto_1

    .line 89
    :cond_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    goto :goto_0

    .line 94
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUntil(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 78
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    .line 79
    :goto_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    iget-object v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 80
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 81
    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    goto :goto_1

    .line 79
    :cond_0
    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    goto :goto_0

    .line 84
    :cond_1
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUntilSpaces()Ljava/lang/String;
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->spaceChars:Ljava/lang/String;

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/CharStream;->readUntil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public seekAfter(C)V
    .locals 3

    .line 46
    :cond_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 47
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_0

    :cond_1
    return-void
.end method

.method public skip(I)V
    .locals 1

    .line 35
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    return-void
.end method

.method public skipSpace()V
    .locals 2

    .line 28
    :goto_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_1

    .line 29
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->buffer:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 30
    iget-object v1, p0, Lcom/flyersoft/books/chmlib/CharStream;->spaceChars:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    goto :goto_1

    .line 28
    :cond_0
    iget v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/books/chmlib/CharStream;->pos:I

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method
