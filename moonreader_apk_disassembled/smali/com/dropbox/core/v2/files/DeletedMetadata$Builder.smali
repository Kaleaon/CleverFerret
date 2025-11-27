.class public Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;
.super Lcom/dropbox/core/v2/files/Metadata$Builder;
.source "DeletedMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/DeletedMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 157
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/DeletedMetadata;
    .locals 6

    .line 230
    new-instance v0, Lcom/dropbox/core/v2/files/DeletedMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->name:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->pathLower:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->pathDisplay:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->parentSharedFolderId:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->previewUrl:Ljava/lang/String;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/files/DeletedMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/files/Metadata;
    .locals 1

    .line 154
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->build()Lcom/dropbox/core/v2/files/DeletedMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;
    .locals 0

    .line 207
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 154
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;
    .locals 0

    .line 189
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 154
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;
    .locals 0

    .line 170
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 154
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;
    .locals 0

    .line 219
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/Metadata$Builder;->withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/Metadata$Builder;
    .locals 0

    .line 154
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;->withPreviewUrl(Ljava/lang/String;)Lcom/dropbox/core/v2/files/DeletedMetadata$Builder;

    move-result-object p1

    return-object p1
.end method
