.class public Lcom/dropbox/core/v2/files/UploadArg$Builder;
.super Lcom/dropbox/core/v2/files/CommitInfo$Builder;
.source "UploadArg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/UploadArg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected contentHash:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 224
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;-><init>(Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 225
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->contentHash:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/files/CommitInfo;
    .locals 1

    .line 219
    invoke-virtual {p0}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->build()Lcom/dropbox/core/v2/files/UploadArg;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/files/UploadArg;
    .locals 9

    .line 375
    new-instance v0, Lcom/dropbox/core/v2/files/UploadArg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    iget-boolean v3, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->autorename:Z

    iget-object v4, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->clientModified:Ljava/util/Date;

    iget-boolean v5, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->mute:Z

    iget-object v6, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->propertyGroups:Ljava/util/List;

    iget-boolean v7, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->strictConflict:Z

    iget-object v8, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->contentHash:Ljava/lang/String;

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/files/UploadArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/WriteMode;ZLjava/util/Date;ZLjava/util/List;ZLjava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0

    .line 290
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withAutorename(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0

    .line 307
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withClientModified(Ljava/util/Date;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method

.method public withContentHash(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 2

    if-eqz p1, :cond_2

    .line 245
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x40

    if-lt v0, v1, :cond_1

    .line 248
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-gt v0, v1, :cond_0

    goto :goto_0

    .line 249
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 246
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 252
    :cond_2
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadArg$Builder;->contentHash:Ljava/lang/String;

    return-object p0
.end method

.method public bridge synthetic withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0

    .line 272
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withMode(Lcom/dropbox/core/v2/files/WriteMode;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0

    .line 326
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withMute(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;)",
            "Lcom/dropbox/core/v2/files/UploadArg$Builder;"
        }
    .end annotation

    .line 342
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withPropertyGroups(Ljava/util/List;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;
    .locals 0

    .line 219
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/files/UploadArg$Builder;->withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 0

    .line 364
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/files/CommitInfo$Builder;->withStrictConflict(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/CommitInfo$Builder;

    return-object p0
.end method
