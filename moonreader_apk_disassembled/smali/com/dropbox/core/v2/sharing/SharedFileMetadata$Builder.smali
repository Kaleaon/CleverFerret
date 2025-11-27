.class public Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
.super Ljava/lang/Object;
.source "SharedFileMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/SharedFileMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected expectedLinkMetadata:Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;

.field protected final id:Ljava/lang/String;

.field protected linkMetadata:Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;

.field protected final name:Ljava/lang/String;

.field protected ownerDisplayNames:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected ownerTeam:Lcom/dropbox/core/v2/users/Team;

.field protected parentSharedFolderId:Ljava/lang/String;

.field protected pathDisplay:Ljava/lang/String;

.field protected pathLower:Ljava/lang/String;

.field protected permissions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/FilePermission;",
            ">;"
        }
    .end annotation
.end field

.field protected final policy:Lcom/dropbox/core/v2/sharing/FolderPolicy;

.field protected final previewUrl:Ljava/lang/String;

.field protected timeInvited:Ljava/util/Date;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/FolderPolicy;Ljava/lang/String;)V
    .locals 2

    .line 383
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_5

    .line 387
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x4

    if-lt v0, v1, :cond_4

    .line 390
    const-string v0, "id:.+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 393
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->id:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 397
    iput-object p2, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->name:Ljava/lang/String;

    if-eqz p3, :cond_1

    .line 401
    iput-object p3, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->policy:Lcom/dropbox/core/v2/sharing/FolderPolicy;

    if-eqz p4, :cond_0

    .line 405
    iput-object p4, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->previewUrl:Ljava/lang/String;

    const/4 p1, 0x0

    .line 406
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 407
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->expectedLinkMetadata:Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;

    .line 408
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->linkMetadata:Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;

    .line 409
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerDisplayNames:Ljava/util/List;

    .line 410
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    .line 411
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->parentSharedFolderId:Ljava/lang/String;

    .line 412
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathDisplay:Ljava/lang/String;

    .line 413
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathLower:Ljava/lang/String;

    .line 414
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->permissions:Ljava/util/List;

    .line 415
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->timeInvited:Ljava/util/Date;

    return-void

    .line 403
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'previewUrl\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 399
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'policy\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 395
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'name\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 391
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 388
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'id\' is shorter than 4"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 385
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'id\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/SharedFileMetadata;
    .locals 15

    .line 598
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->id:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->policy:Lcom/dropbox/core/v2/sharing/FolderPolicy;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->previewUrl:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->expectedLinkMetadata:Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->linkMetadata:Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;

    iget-object v8, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerDisplayNames:Ljava/util/List;

    iget-object v9, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    iget-object v10, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->parentSharedFolderId:Ljava/lang/String;

    iget-object v11, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathDisplay:Ljava/lang/String;

    iget-object v12, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathLower:Ljava/lang/String;

    iget-object v13, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->permissions:Ljava/util/List;

    iget-object v14, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->timeInvited:Ljava/util/Date;

    invoke-direct/range {v0 .. v14}, Lcom/dropbox/core/v2/sharing/SharedFileMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/FolderPolicy;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/AccessLevel;Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;Ljava/util/List;Lcom/dropbox/core/v2/users/Team;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/util/Date;)V

    return-object v0
.end method

.method public withAccessType(Lcom/dropbox/core/v2/sharing/AccessLevel;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 427
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    return-object p0
.end method

.method public withExpectedLinkMetadata(Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 442
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->expectedLinkMetadata:Lcom/dropbox/core/v2/sharing/ExpectedSharedContentLinkMetadata;

    return-object p0
.end method

.method public withLinkMetadata(Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 456
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->linkMetadata:Lcom/dropbox/core/v2/sharing/SharedContentLinkMetadata;

    return-object p0
.end method

.method public withOwnerDisplayNames(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 475
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 477
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'ownerDisplayNames\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 481
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerDisplayNames:Ljava/util/List;

    return-object p0
.end method

.method public withOwnerTeam(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 494
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    return-object p0
.end method

.method public withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 512
    const-string v0, "[-_0-9a-zA-Z:]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 513
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'parentSharedFolderId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 516
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->parentSharedFolderId:Ljava/lang/String;

    return-object p0
.end method

.method public withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 531
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathDisplay:Ljava/lang/String;

    return-object p0
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 544
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->pathLower:Ljava/lang/String;

    return-object p0
.end method

.method public withPermissions(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/sharing/FilePermission;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 566
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/sharing/FilePermission;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 568
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'permissions\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 572
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->permissions:Ljava/util/List;

    return-object p0
.end method

.method public withTimeInvited(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;
    .locals 0

    .line 587
    invoke-static {p1}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFileMetadata$Builder;->timeInvited:Ljava/util/Date;

    return-object p0
.end method
