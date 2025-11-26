.class public Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
.super Lcom/dropbox/core/v2/DbxUploadStyleBuilder;
.source "AlphaUploadBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/dropbox/core/v2/DbxUploadStyleBuilder<",
        "Lcom/dropbox/core/v2/files/FileMetadata;",
        "Lcom/dropbox/core/v2/files/UploadError;",
        "Lcom/dropbox/core/v2/files/UploadErrorException;",
        ">;"
    }
.end annotation


# instance fields
.field private final _builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

.field private final _client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;


# direct methods
.method constructor <init>(Lcom/dropbox/core/v2/files/DbxUserFilesRequests;Lcom/dropbox/core/v2/files/UploadArg$Builder;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/dropbox/core/v2/DbxUploadStyleBuilder;-><init>()V

    if-eqz p1, :cond_1

    .line 38
    iput-object p1, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    if-eqz p2, :cond_0

    .line 42
    iput-object p2, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-void

    .line 40
    :cond_0
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "_builder"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
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

    .line 21
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->start()Lcom/dropbox/core/v2/files/AlphaUploadUploader;

    move-result-object v0

    return-object v0
.end method

.method public start()Lcom/dropbox/core/v2/files/AlphaUploadUploader;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/dropbox/core/v2/files/UploadErrorException;,
            Lcom/dropbox/core/DbxException;
        }
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->build()Lcom/dropbox/core/v2/files/UploadArg;

    move-result-object v0

    .line 177
    iget-object v1, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_client:Lcom/dropbox/core/v2/files/DbxUserFilesRequests;

    invoke-virtual {v1, v0}, Lcom/dropbox/core/v2/files/DbxUserFilesRequests;->alphaUpload(Lcom/dropbox/core/v2/files/UploadArg;)Lcom/dropbox/core/v2/files/AlphaUploadUploader;

    move-result-object v0

    return-object v0
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 61
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)",
            "Lcom/dropbox/core/v2/files/AlphaUploadBuilder;"
        }
    .end annotation

    .line 129
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method

.method public withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/AlphaUploadBuilder;
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/dropbox/core/v2/files/AlphaUploadBuilder;->_builder:Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-virtual {v0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    return-object p0
.end method
