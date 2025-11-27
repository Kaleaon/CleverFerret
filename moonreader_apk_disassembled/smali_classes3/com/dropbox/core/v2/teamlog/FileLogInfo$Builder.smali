.class public Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;
.super Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
.source "FileLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FileLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V
    .locals 0

    .line 120
    invoke-direct {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V

    return-void
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FileLogInfo;
    .locals 5

    .line 166
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->fileId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->fileSize:Ljava/lang/Long;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/teamlog/FileLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;
    .locals 1

    .line 117
    invoke-virtual {p0}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->build()Lcom/dropbox/core/v2/teamlog/FileLogInfo;

    move-result-object v0

    return-object v0
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;
    .locals 0

    .line 131
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 117
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;
    .locals 0

    .line 143
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 117
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method

.method public withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;
    .locals 0

    .line 155
    invoke-super {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    return-object p0
.end method

.method public bridge synthetic withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 117
    invoke-virtual {p0, p1}, Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;->withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileLogInfo$Builder;

    move-result-object p1

    return-object p1
.end method
