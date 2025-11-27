.class public abstract Lcom/dropbox/core/v2/DbxUploadStyleBuilder;
.super Ljava/lang/Object;
.source "DbxUploadStyleBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "E:",
        "Ljava/lang/Object;",
        "X:",
        "Lcom/dropbox/core/DbxApiException;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract start()Lcom/dropbox/core/DbxUploader;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/dropbox/core/DbxUploader<",
            "TR;TE;TX;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation
.end method

.method public uploadAndFinish(Ljava/io/InputStream;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")TR;^TX;^",
            "Lcom/dropbox/core/DbxException;",
            "^",
            "Ljava/io/IOException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;->start()Lcom/dropbox/core/DbxUploader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/dropbox/core/DbxUploader;->uploadAndFinish(Ljava/io/InputStream;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public uploadAndFinish(Ljava/io/InputStream;J)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "J)TR;^TX;^",
            "Lcom/dropbox/core/DbxException;",
            "^",
            "Ljava/io/IOException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 113
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;->start()Lcom/dropbox/core/DbxUploader;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/dropbox/core/DbxUploader;->uploadAndFinish(Ljava/io/InputStream;J)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public uploadAndFinish(Ljava/io/InputStream;JLcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "J",
            "Lcom/dropbox/core/util/IOUtil$ProgressListener;",
            ")TR;^TX;^",
            "Lcom/dropbox/core/DbxException;",
            "^",
            "Ljava/io/IOException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 137
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;->start()Lcom/dropbox/core/DbxUploader;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/dropbox/core/DbxUploader;->uploadAndFinish(Ljava/io/InputStream;JLcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public uploadAndFinish(Ljava/io/InputStream;Lcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            "Lcom/dropbox/core/util/IOUtil$ProgressListener;",
            ")TR;^TX;^",
            "Lcom/dropbox/core/DbxException;",
            "^",
            "Ljava/io/IOException;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxApiException;,
            Lcom/dropbox/core/DbxException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 160
    invoke-virtual {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;->start()Lcom/dropbox/core/DbxUploader;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/dropbox/core/DbxUploader;->uploadAndFinish(Ljava/io/InputStream;Lcom/dropbox/core/util/IOUtil$ProgressListener;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
