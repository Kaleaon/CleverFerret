.class public Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;
.super Ljava/lang/Object;
.source "FileOrFolderLogInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;,
        Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    }
.end annotation


# instance fields
.field protected final displayName:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final fileId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final fileSize:Ljava/lang/Long;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/teamlog/PathLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, v0, v0, v0}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/teamlog/PathLogInfo;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/Long;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    .line 56
    iput-object p2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->displayName:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileId:Ljava/lang/String;

    .line 58
    iput-object p4, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileSize:Ljava/lang/Long;

    return-void

    .line 53
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'path\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;
    .locals 1

    .line 126
    new-instance v0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Builder;-><init>(Lcom/dropbox/core/v2/teamlog/PathLogInfo;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 216
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 217
    check-cast p1, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;

    .line 218
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/teamlog/PathLogInfo;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->displayName:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->displayName:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_5

    .line 219
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileId:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    if-eqz v2, :cond_5

    .line 220
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileSize:Ljava/lang/Long;

    iget-object p1, p1, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileSize:Ljava/lang/Long;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_5

    .line 221
    invoke-virtual {v2, p1}, Ljava/lang/Long;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_5

    goto :goto_0

    :cond_5
    return v1

    :cond_6
    :goto_0
    return v0

    :cond_7
    return v1
.end method

.method public getDisplayName()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->displayName:Ljava/lang/String;

    return-object v0
.end method

.method public getFileId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getFileSize()Ljava/lang/Long;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 112
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileSize:Ljava/lang/Long;

    return-object v0
.end method

.method public getPath()Lcom/dropbox/core/v2/teamlog/PathLogInfo;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 82
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 198
    iget-object v0, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->path:Lcom/dropbox/core/v2/teamlog/PathLogInfo;

    iget-object v1, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->displayName:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileId:Ljava/lang/String;

    iget-object v3, p0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo;->fileSize:Ljava/lang/Long;

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v0, 0x1

    aput-object v1, v4, v0

    const/4 v0, 0x2

    aput-object v2, v4, v0

    const/4 v0, 0x3

    aput-object v3, v4, v0

    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 231
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 243
    sget-object v0, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/teamlog/FileOrFolderLogInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
