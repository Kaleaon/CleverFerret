.class public Lcom/github/junrar/io/ReadOnlyAccessFile;
.super Ljava/io/RandomAccessFile;
.source "ReadOnlyAccessFile.java"

# interfaces
.implements Lcom/github/junrar/io/IReadOnlyAccess;


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 38
    const-string v0, "r"

    invoke-direct {p0, p1, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getPosition()J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 50
    invoke-virtual {p0}, Lcom/github/junrar/io/ReadOnlyAccessFile;->getFilePointer()J

    move-result-wide v0

    return-wide v0
.end method

.method public readFully([BI)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    .line 44
    invoke-virtual {p0, p1, v0, p2}, Lcom/github/junrar/io/ReadOnlyAccessFile;->readFully([BII)V

    return p2
.end method

.method public setPosition(J)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 55
    invoke-virtual {p0, p1, p2}, Lcom/github/junrar/io/ReadOnlyAccessFile;->seek(J)V

    return-void
.end method
