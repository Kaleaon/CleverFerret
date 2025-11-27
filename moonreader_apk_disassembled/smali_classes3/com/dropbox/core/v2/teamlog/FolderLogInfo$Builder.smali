.class public Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
.source "FolderLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FolderLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected fileCount:Ljava/lang/Long;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V
    .locals 0

    .line 137
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V

    const/4 p1, 0x0

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->fileCount:Ljava/lang/Long;

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;
    .locals 1

    .line 132
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/FolderLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public build()Lcom/dropbox/core/v2/teamlog/FolderLogInfo;
    .locals 6

    .line 196
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->fileId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->fileSize:Ljava/lang/Long;

    iget-object v5, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->fileCount:Ljava/lang/Long;

    invoke-direct/range {v0 .. v5}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    return-object v0
.end method

.method public bridge synthetic withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 132
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;
    .locals 0

    .line 161
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method

.method public withFileCount(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;
    .locals 0

    .line 149
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->fileCount:Ljava/lang/Long;

    return-object p0
.end method

.method public bridge synthetic withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 132
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;
    .locals 0

    .line 173
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 132
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;->withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FolderLogInfo$Builder;
    .locals 0

    .line 185
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method
