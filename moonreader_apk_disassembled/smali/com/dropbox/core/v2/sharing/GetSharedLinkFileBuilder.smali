.class public Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;
.super Lcom/dropbox/core/v2/DbxDownloadStyleBuilder;
.source "GetSharedLinkFileBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/v2/DbxDownloadStyleBuilder<",
        "Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;",
        ">;"
    }
.end annotation


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/dropbox/core/v2/DbxDownloadStyleBuilder;-><init>()V

    if-eqz p1, :cond_1

    .line 34
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    if-eqz p2, :cond_0

    .line 38
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-void

    .line 36
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 32
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/DbxDownloader;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/dropbox/core/DbxDownloader<",
            "Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/GetSharedLinkFileErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->build()Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;

    move-result-object v0

    .line 75
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;

    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->getHeaders()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Lcom/dropbox/core/v2/sharing/DbxUserSharingRequests;->getSharedLinkFile(Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;Ljava/util/List;)Lcom/dropbox/core/DbxDownloader;

    move-result-object v0

    return-object v0
.end method

.method public withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/GetSharedLinkFileBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-object p0
.end method
