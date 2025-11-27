.class public final Lcom/dropbox/core/v1/DbxClientV1$Downloader;
.super Ljava/lang/Object;
.source "DbxClientV1.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v1/DbxClientV1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Downloader"
.end annotation


# instance fields
.field public final body:Ljava/io/InputStream;

.field public final metadata:Lcom/dropbox/core/v1/DbxEntry$File;


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v1/DbxEntry$File;Ljava/io/InputStream;)V
    .locals 0

    .line 532
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 533
    iput-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->metadata:Lcom/dropbox/core/v1/DbxEntry$File;

    .line 534
    iput-object p2, p0, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->body:Ljava/io/InputStream;

    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 563
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->body:Ljava/io/InputStream;

    invoke-static {v0}, Lcom/dropbox/core/util/IOUtil;->closeInput(Ljava/io/InputStream;)V

    return-void
.end method

.method copyBodyAndClose(Ljava/io/OutputStream;)Lcom/dropbox/core/v1/DbxEntry$File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 545
    :try_start_0
    iget-object v0, p0, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->body:Ljava/io/InputStream;

    invoke-static {v0, p1}, Lcom/dropbox/core/util/IOUtil;->copyStreamToStream(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    :try_end_0
    .catch Lcom/dropbox/core/util/IOUtil$ReadException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/dropbox/core/util/IOUtil$WriteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 556
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->close()V

    .line 558
    iget-object p1, p0, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->metadata:Lcom/dropbox/core/v1/DbxEntry$File;

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 553
    :try_start_1
    invoke-virtual {p1}, Lcom/dropbox/core/util/IOUtil$WriteException;->getCause()Ljava/io/IOException;

    move-result-object p1

    throw p1

    :catch_1
    move-exception p1

    .line 549
    new-instance v0, Lcom/dropbox/core/NetworkIOException;

    invoke-virtual {p1}, Lcom/dropbox/core/util/IOUtil$ReadException;->getCause()Ljava/io/IOException;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/dropbox/core/NetworkIOException;-><init>(Ljava/io/IOException;)V

    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 556
    :goto_0
    invoke-virtual {p0}, Lcom/dropbox/core/v1/DbxClientV1$Downloader;->close()V

    .line 557
    throw p1
.end method
