.class public Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
.super Ljava/lang/Object;
.source "SharedFolderMetadataBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

.field protected final isInsideTeamFolder:Z

.field protected final isTeamFolder:Z

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

.field protected parentFolderName:Ljava/lang/String;

.field protected parentSharedFolderId:Ljava/lang/String;

.field protected pathDisplay:Ljava/lang/String;

.field protected pathLower:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/sharing/AccessLevel;ZZ)V
    .locals 0

    .line 251
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 255
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    .line 256
    iput-boolean p2, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->isInsideTeamFolder:Z

    .line 257
    iput-boolean p3, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->isTeamFolder:Z

    const/4 p1, 0x0

    .line 258
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerDisplayNames:Ljava/util/List;

    .line 259
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    .line 260
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentSharedFolderId:Ljava/lang/String;

    .line 261
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathDisplay:Ljava/lang/String;

    .line 262
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathLower:Ljava/lang/String;

    .line 263
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentFolderName:Ljava/lang/String;

    return-void

    .line 253
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'accessType\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase;
    .locals 10

    .line 371
    new-instance v0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->accessType:Lcom/dropbox/core/v2/sharing/AccessLevel;

    iget-boolean v2, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->isInsideTeamFolder:Z

    iget-boolean v3, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->isTeamFolder:Z

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerDisplayNames:Ljava/util/List;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentSharedFolderId:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathDisplay:Ljava/lang/String;

    iget-object v8, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathLower:Ljava/lang/String;

    iget-object v9, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentFolderName:Ljava/lang/String;

    invoke-direct/range {v0 .. v9}, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase;-><init>(Lcom/dropbox/core/v2/sharing/AccessLevel;ZZLjava/util/List;Lcom/dropbox/core/v2/users/Team;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public withOwnerDisplayNames(Ljava/util/List;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 281
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

    .line 283
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'ownerDisplayNames\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 287
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerDisplayNames:Ljava/util/List;

    return-object p0
.end method

.method public withOwnerTeam(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 0

    .line 300
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->ownerTeam:Lcom/dropbox/core/v2/users/Team;

    return-object p0
.end method

.method public withParentFolderName(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 0

    .line 360
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentFolderName:Ljava/lang/String;

    return-object p0
.end method

.method public withParentSharedFolderId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 1

    if-eqz p1, :cond_1

    .line 318
    const-string v0, "[-_0-9a-zA-Z:]+"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 319
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'parentSharedFolderId\' does not match pattern"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 322
    :cond_1
    :goto_0
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->parentSharedFolderId:Ljava/lang/String;

    return-object p0
.end method

.method public withPathDisplay(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 0

    .line 335
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathDisplay:Ljava/lang/String;

    return-object p0
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;
    .locals 0

    .line 348
    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/SharedFolderMetadataBase$Builder;->pathLower:Ljava/lang/String;

    return-object p0
.end method
