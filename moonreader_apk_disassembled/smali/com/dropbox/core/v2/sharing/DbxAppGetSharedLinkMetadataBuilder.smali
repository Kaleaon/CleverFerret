.class public Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;
.super Ljava/lang/Object;
.source "DbxAppGetSharedLinkMetadataBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/sharing/DbxAppSharingRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/sharing/DbxAppSharingRequests;Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;)V
    .locals 0

    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 32
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxAppSharingRequests;

    if-eqz p2, :cond_0

    .line 36
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 30
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_client"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public start()Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/sharing/SharedLinkErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->build()Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;

    move-result-object v0

    .line 75
    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_client:Lcom/dropbox/core/v2/sharing/DbxAppSharingRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/sharing/DbxAppSharingRequests;->getSharedLinkMetadata(Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;
    .locals 1

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->withLinkPassword(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-object p0
.end method

.method public withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/dropbox/core/v2/sharing/DbxAppGetSharedLinkMetadataBuilder;->_builder:Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;->withPath(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/GetSharedLinkMetadataArg$Builder;

    return-object p0
.end method
