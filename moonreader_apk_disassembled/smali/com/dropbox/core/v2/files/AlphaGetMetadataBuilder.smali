.class public Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
.super Ljava/lang/Object;
.source "AlphaGetMetadataBuilder.java"


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;)V
    .locals 0

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 35
    iput-object p1, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 39
    iput-object p2, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-void

    .line 37
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 33
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
            Lcom/dropbox/core/v2/files/AlphaGetMetadataErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 127
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->build()Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;

    move-result-object v0

    .line 128
    iget-object v1, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->alphaGetMetadata(Lcom/dropbox/core/v2/files/AlphaGetMetadataArg;)Lcom/dropbox/core/v2/files/Metadata;

    move-result-object v0

    return-object v0
.end method

.method public withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->withIncludeDeleted(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1

    .line 86
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->withIncludeHasExplicitSharedMembers(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1

    .line 54
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->withIncludeMediaInfo(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1

    .line 101
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->withIncludePropertyGroups(Lcom/dropbox/core/v2/fileproperties/TemplateFilterBase;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-object p0
.end method

.method public withIncludePropertyTemplates(Ljava/util/List;)Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;"
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaGetMetadataBuilder;->_builder:Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;->withIncludePropertyTemplates(Ljava/util/List;)Lcom/dropbox/core/v2/files/AlphaGetMetadataArg$Builder;

    return-object p0
.end method
