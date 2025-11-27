.class Lorg/apache/commons/net/nntp/ReplyIterator;
.super Ljava/lang/Object;
.source "ReplyIterator.java"

# interfaces
.implements Ljava/util/Iterator;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/lang/String;",
        ">;",
        "Ljava/lang/Iterable<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private line:Ljava/lang/String;

.field private final reader:Ljava/io/BufferedReader;

.field private savedException:Ljava/lang/Exception;


# direct methods
.method constructor <init>(Ljava/io/BufferedReader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 57
    invoke-direct {p0, p1, v0}, Lorg/apache/commons/net/nntp/ReplyIterator;-><init>(Ljava/io/BufferedReader;Z)V

    return-void
.end method

.method constructor <init>(Ljava/io/BufferedReader;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p2, :cond_0

    .line 49
    new-instance p2, Lorg/apache/commons/net/io/DotTerminatedMessageReader;

    invoke-direct {p2, p1}, Lorg/apache/commons/net/io/DotTerminatedMessageReader;-><init>(Ljava/io/Reader;)V

    move-object p1, p2

    :cond_0
    iput-object p1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->reader:Ljava/io/BufferedReader;

    .line 50
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->line:Ljava/lang/String;

    if-nez p2, :cond_1

    .line 52
    invoke-static {p1}, Lorg/apache/commons/net/io/Util;->closeQuietly(Ljava/io/Closeable;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 2

    .line 62
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->savedException:Ljava/lang/Exception;

    if-nez v0, :cond_1

    .line 65
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->line:Ljava/lang/String;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0

    .line 63
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->savedException:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    return-object p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 34
    invoke-virtual {p0}, Lorg/apache/commons/net/nntp/ReplyIterator;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/util/NoSuchElementException;
        }
    .end annotation

    .line 70
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->savedException:Ljava/lang/Exception;

    if-nez v0, :cond_2

    .line 73
    iget-object v0, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->line:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 78
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->reader:Ljava/io/BufferedReader;

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->line:Ljava/lang/String;

    if-nez v1, :cond_0

    .line 80
    iget-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->reader:Ljava/io/BufferedReader;

    invoke-static {v1}, Lorg/apache/commons/net/io/Util;->closeQuietly(Ljava/io/Closeable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v1

    .line 83
    iput-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->savedException:Ljava/lang/Exception;

    .line 84
    iget-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->reader:Ljava/io/BufferedReader;

    invoke-static {v1}, Lorg/apache/commons/net/io/Util;->closeQuietly(Ljava/io/Closeable;)V

    :cond_0
    return-object v0

    .line 75
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0

    .line 71
    :cond_2
    new-instance v0, Ljava/util/NoSuchElementException;

    iget-object v1, p0, Lorg/apache/commons/net/nntp/ReplyIterator;->savedException:Ljava/lang/Exception;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public remove()V
    .locals 1

    .line 91
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
