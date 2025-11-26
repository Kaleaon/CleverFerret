.class public Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
.super Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
.source "FolderLinkMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/FolderLinkMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;)V
    .locals 0

    .line 191
    invoke-direct {p0, p1, p2, p3}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/FolderLinkMetadata;
    .locals 9

    .line 273
    new-instance v0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->url:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->linkPermissions:Lcom/dropbox/core/v2/sharing/LinkPermissions;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->id:Ljava/lang/String;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->expires:Ljava/util/Date;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->pathLower:Ljava/lang/String;

    iget-object v7, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->teamMemberInfo:Lcom/dropbox/core/v2/sharing/TeamMemberInfo;

    iget-object v8, p0, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->contentOwnerTeamInfo:Lcom/dropbox/core/v2/users/Team;

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;Ljava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/TeamMemberInfo;Lcom/dropbox/core/v2/users/Team;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;
    .locals 1

    .line 188
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->build()Lcom/dropbox/core/v2/sharing/FolderLinkMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
    .locals 0

    .line 262
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
    .locals 0

    .line 219
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
    .locals 0

    .line 206
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
    .locals 0

    .line 233
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;
    .locals 0

    .line 247
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 188
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;->withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/FolderLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method
