.class public Lcom/rtfparserkit/parser/RtfStreamSource;
.super Ljava/lang/Object;
.source "RtfStreamSource.java"

# interfaces
.implements Lcom/rtfparserkit/parser/IRtfSource;


# instance fields
.field private pushBackChar:I

.field private final stream:Ljava/io/InputStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 29
    iput v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->pushBackChar:I

    .line 33
    instance-of v0, p1, Ljava/io/BufferedInputStream;

    if-eqz v0, :cond_0

    .line 35
    iput-object p1, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->stream:Ljava/io/InputStream;

    return-void

    .line 39
    :cond_0
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->stream:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    iget v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->pushBackChar:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 51
    iput v1, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->pushBackChar:I

    return v0

    .line 55
    :cond_0
    iget-object v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->stream:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    return v0
.end method

.method public read([B)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->stream:Ljava/io/InputStream;

    invoke-virtual {v0, p1}, Ljava/io/InputStream;->read([B)I

    move-result p1

    return p1
.end method

.method public unread(I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    iget v0, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->pushBackChar:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 69
    iput p1, p0, Lcom/rtfparserkit/parser/RtfStreamSource;->pushBackChar:I

    return-void

    .line 66
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Unread not possible"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
