.class public Lcom/dropbox/core/v2/files/GetMetadataBuilder;
.super Ljava/lang/Object;
.source "GetMetadataBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 33
    iput-object p1, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 37
    iput-object p2, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

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
.method public start()Lcom/dropbox/core/v2/files/Metadata;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/GetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 107
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;->build()Lcom/dropbox/core/v2/files/GetMetadataArg;

    move-result-object v0

    .line 108
    iget-object v1, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->getMetadata(Lcom/dropbox/core/v2/files/GetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object v0

    return-object v0
.end method

.method public withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataBuilder;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;->withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataBuilder;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;->withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataBuilder;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;->withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/GetMetadataBuilder;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/dropbox/core/v2/files/GetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;->withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/GetMetadataArg$Builder;

    return-object p0
.end method
