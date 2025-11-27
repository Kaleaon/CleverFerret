.class public Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;
.super Ljava/lang/Object;
.source "InputStreamReadOnlyAccessFile.java"

# interfaces
.implements Lcom/github/junrar/io/IReadOnlyAccess;


# instance fields
.field private is:Lcom/github/junrar/io/RandomAccessStream;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    new-instance v0, Lcom/github/junrar/io/RandomAccessStream;

    new-instance v1, Ljava/io/BufferedInputStream;

    invoke-direct {v1, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Lcom/github/junrar/io/RandomAccessStream;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

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
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0}, Lcom/github/junrar/io/RandomAccessStream;->close()V

    return-void
.end method

.method public getPosition()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 30
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0}, Lcom/github/junrar/io/RandomAccessStream;->getLongFilePointer()J

    move-result-wide v0

    return-wide v0
.end method

.method public read()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0}, Lcom/github/junrar/io/RandomAccessStream;->read()I

    move-result v0

    return v0
.end method

.method public read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0, p1, p2, p3}, Lcom/github/junrar/io/RandomAccessStream;->read([BII)I

    move-result p1

    return p1
.end method

.method public readFully([BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0, p1, p2}, Lcom/github/junrar/io/RandomAccessStream;->readFully([BI)V

    return p2
.end method

.method public setPosition(J)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 35
    iget-object v0, p0, Lcom/github/junrar/io/InputStreamReadOnlyAccessFile;->is:Lcom/github/junrar/io/RandomAccessStream;

    invoke-virtual {v0, p1, p2}, Lcom/github/junrar/io/RandomAccessStream;->seek(J)V

    return-void
.end method
