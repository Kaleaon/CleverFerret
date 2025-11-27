.class public Lcom/github/junrar/vfs2/provider/rar/FileSystem;
.super Ljava/lang/Object;
.source "FileSystem.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createNewFile(Ljava/io/File;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    return-void
.end method

.method public mkdir(Ljava/io/File;)V
    .locals 0

    .line 9
    invoke-virtual {p1}, Ljava/io/File;->mkdir()Z

    return-void
.end method
