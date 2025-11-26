.class public Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;
.super Lcom/dropbox/core/v2/DbxUploadStyleBuilder;
.source "UploadSessionStartBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/v2/DbxUploadStyleBuilder<",
        "Lcom/dropbox/core/v2/files/UploadSessionStartResult;",
        "Lcom/dropbox/core/v2/files/UploadSessionStartError;",
        "Lcom/dropbox/core/v2/files/UploadSessionStartErrorException;",
        ">;"
    }
.end annotation


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;-><init>()V

    if-eqz p1, :cond_1

    .line 33
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    return-void

    .line 35
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 31
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public bridge synthetic start()Lcom/dropbox/core/DbxUploader;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 16
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->start()Lcom/dropbox/core/v2/files/UploadSessionStartUploader;

    move-result-object v0

    return-object v0
.end method

.method public start()Lcom/dropbox/core/v2/files/UploadSessionStartUploader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/UploadSessionStartErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->build()Lcom/dropbox/core/v2/files/UploadSessionStartArg;

    move-result-object v0

    .line 94
    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->uploadSessionStart(Lcom/dropbox/core/v2/files/UploadSessionStartArg;)Lcom/dropbox/core/v2/files/UploadSessionStartUploader;

    move-result-object v0

    return-object v0
.end method

.method public withClose(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->withClose(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    return-object p0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    return-object p0
.end method

.method public withSessionType(Lcom/dropbox/core/v2/files/UploadSessionType;)Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionStartBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;->withSessionType(Lcom/dropbox/core/v2/files/UploadSessionType;)Lcom/dropbox/core/v2/files/UploadSessionStartArg$Builder;

    return-object p0
.end method
