.class public Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
.super Ljava/lang/Object;
.source "FileOrFolderLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected displayName:Ljava/lang/String;

.field protected fileId:Ljava/lang/String;

.field protected fileSize:Ljava/lang/Long;

.field protected final path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V
    .locals 1

    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 143
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    const/4 p1, 0x0

    .line 144
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->displayName:Ljava/lang/String;

    .line 145
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileId:Ljava/lang/String;

    .line 146
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileSize:Ljava/lang/Long;

    return-void

    .line 141
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'path\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;
    .locals 5

    .line 192
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->displayName:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileId:Ljava/lang/String;

    iget-object v4, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileSize:Ljava/lang/Long;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    return-object v0
.end method

.method public withDisplayName(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 157
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->displayName:Ljava/lang/String;

    return-object p0
.end method

.method public withFileId(Ljava/lang/String;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileId:Ljava/lang/String;

    return-object p0
.end method

.method public withFileSize(Ljava/lang/Long;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 0

    .line 181
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;->fileSize:Ljava/lang/Long;

    return-object p0
.end method
