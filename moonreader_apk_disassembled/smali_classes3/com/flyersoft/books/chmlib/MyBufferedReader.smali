.class public Lcom/flyersoft/books/chmlib/MyBufferedReader;
.super Ljava/io/BufferedReader;
.source "MyBufferedReader.java"


# static fields
.field public static final spaceChars:Ljava/lang/String; = " \n\r\t"

.field public static final spaceOrTagEndChars:Ljava/lang/String; = " \n\r\t>"


# instance fields
.field public charArray:Lcom/flyersoft/books/chmlib/CharArray;


# direct methods
.method public constructor <init>(Ljava/io/Reader;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 13
    new-instance p1, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {p1}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    return-void
.end method

.method public constructor <init>(Ljava/io/Reader;I)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 13
    new-instance p1, Lcom/flyersoft/books/chmlib/CharArray;

    invoke-direct {p1}, Lcom/flyersoft/books/chmlib/CharArray;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    return-void
.end method


# virtual methods
.method public eof()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->peek()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public peek()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 80
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->mark(I)V

    .line 81
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    move-result v0

    .line 82
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->reset()V

    return v0
.end method

.method public readNextXMLTag(Lcom/flyersoft/books/chmlib/CharArray;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x3c

    .line 92
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    move-result v0

    if-gez v0, :cond_0

    const/4 p1, 0x0

    return p1

    .line 94
    :cond_0
    const-string v0, " \n\r\t>"

    invoke-virtual {p0, v0, p1}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;Lcom/flyersoft/books/chmlib/CharArray;)I

    move-result p1

    return p1
.end method

.method public readNextXMLTag()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x3c

    .line 98
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->seekAfter(C)I

    move-result v0

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 100
    :cond_0
    const-string v0, " \n\r\t>"

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public readUntil(CLcom/flyersoft/books/chmlib/CharArray;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-virtual {p2}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    :goto_0
    const/4 v0, 0x1

    .line 29
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->mark(I)V

    .line 30
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    move-result v0

    if-ltz v0, :cond_1

    if-ne p1, v0, :cond_0

    goto :goto_1

    .line 35
    :cond_0
    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/CharArray;->append(I)V

    goto :goto_0

    .line 32
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->reset()V

    .line 37
    iget p1, p2, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    return p1
.end method

.method public readUntil(Ljava/lang/String;Lcom/flyersoft/books/chmlib/CharArray;)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 46
    invoke-virtual {p2}, Lcom/flyersoft/books/chmlib/CharArray;->clear()Lcom/flyersoft/books/chmlib/CharArray;

    :goto_0
    const/4 v0, 0x1

    .line 48
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->mark(I)V

    .line 49
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    move-result v0

    if-ltz v0, :cond_1

    .line 50
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    goto :goto_1

    .line 54
    :cond_0
    invoke-virtual {p2, v0}, Lcom/flyersoft/books/chmlib/CharArray;->append(I)V

    goto :goto_0

    .line 51
    :cond_1
    :goto_1
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->reset()V

    .line 56
    iget p1, p2, Lcom/flyersoft/books/chmlib/CharArray;->len:I

    return p1
.end method

.method public readUntil(C)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(CLcom/flyersoft/books/chmlib/CharArray;)I

    .line 42
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/CharArray;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUntil(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;Lcom/flyersoft/books/chmlib/CharArray;)I

    .line 60
    iget-object p1, p0, Lcom/flyersoft/books/chmlib/MyBufferedReader;->charArray:Lcom/flyersoft/books/chmlib/CharArray;

    invoke-virtual {p1}, Lcom/flyersoft/books/chmlib/CharArray;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public readUntilSpaces()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    const-string v0, " \n\r\t"

    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->readUntil(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public seekAfter(C)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    move-result v0

    if-ltz v0, :cond_1

    if-ne v0, p1, :cond_0

    :cond_1
    return v0
.end method

.method public skipSpace()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :cond_0
    const/4 v0, 0x1

    .line 70
    invoke-virtual {p0, v0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->mark(I)V

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->read()I

    move-result v0

    if-ltz v0, :cond_1

    .line 72
    const-string v1, " \n\r\t"

    invoke-virtual {v1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-gez v0, :cond_0

    .line 73
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/books/chmlib/MyBufferedReader;->reset()V

    return-void
.end method
