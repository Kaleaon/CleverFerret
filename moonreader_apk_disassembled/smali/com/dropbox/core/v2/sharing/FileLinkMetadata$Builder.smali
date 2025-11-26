.class public Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
.super Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
.source "FileLinkMetadata.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/sharing/FileLinkMetadata;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected final clientModified:Ljava/util/Date;

.field protected final rev:Ljava/lang/String;

.field protected final serverModified:Ljava/util/Date;

.field protected final size:J


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;J)V
    .locals 0

    .line 307
    invoke-direct {p0, p1, p2, p3}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;)V

    if-eqz p4, :cond_4

    .line 311
    invoke-static {p4}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->clientModified:Ljava/util/Date;

    if-eqz p5, :cond_3

    .line 315
    invoke-static {p5}, Lcom/dropbox/core/util/LangUtil;->truncateMillis(Ljava/util/Date;)Ljava/util/Date;

    move-result-object p1

    iput-object p1, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->serverModified:Ljava/util/Date;

    if-eqz p6, :cond_2

    .line 319
    invoke-virtual {p6}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x9

    if-lt p1, p2, :cond_1

    .line 322
    const-string p1, "[0-9a-f]+"

    invoke-static {p1, p6}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 325
    iput-object p6, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->rev:Ljava/lang/String;

    .line 326
    iput-wide p7, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->size:J

    return-void

    .line 323
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 320
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'rev\' is shorter than 9"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 317
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'rev\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 313
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'serverModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 309
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'clientModified\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/sharing/FileLinkMetadata;
    .locals 14

    .line 408
    new-instance v0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata;

    iget-object v1, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->url:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->name:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->linkPermissions:Lcom/dropbox/core/v2/sharing/LinkPermissions;

    iget-object v4, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->clientModified:Ljava/util/Date;

    iget-object v5, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->serverModified:Ljava/util/Date;

    iget-object v6, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->rev:Ljava/lang/String;

    iget-wide v7, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->size:J

    iget-object v9, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->id:Ljava/lang/String;

    iget-object v10, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->expires:Ljava/util/Date;

    iget-object v11, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->pathLower:Ljava/lang/String;

    iget-object v12, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->teamMemberInfo:Lcom/dropbox/core/v2/sharing/TeamMemberInfo;

    iget-object v13, p0, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->contentOwnerTeamInfo:Lcom/dropbox/core/v2/users/Team;

    invoke-direct/range {v0 .. v13}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/LinkPermissions;Ljava/util/Date;Ljava/util/Date;Ljava/lang/String;JLjava/lang/String;Ljava/util/Date;Ljava/lang/String;Lcom/dropbox/core/v2/sharing/TeamMemberInfo;Lcom/dropbox/core/v2/users/Team;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/sharing/SharedLinkMetadata;
    .locals 1

    .line 300
    invoke-virtual {p0}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->build()Lcom/dropbox/core/v2/sharing/FileLinkMetadata;

    move-result-object v0

    return-object v0
.end method

.method public withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
    .locals 0

    .line 397
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 300
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->withContentOwnerTeamInfo(Lcom/dropbox/core/v2/users/Team;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
    .locals 0

    .line 354
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 300
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->withExpires(Ljava/util/Date;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
    .locals 0

    .line 341
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 300
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->withId(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
    .locals 0

    .line 368
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 300
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->withPathLower(Ljava/lang/String;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;
    .locals 0

    .line 382
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;->withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;

    return-object p0
.end method

.method public bridge synthetic withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/SharedLinkMetadata$Builder;
    .locals 0

    .line 300
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;->withTeamMemberInfo(Lcom/dropbox/core/v2/sharing/TeamMemberInfo;)Lcom/dropbox/core/v2/sharing/FileLinkMetadata$Builder;

    move-result-object p1

    return-object p1
.end method
