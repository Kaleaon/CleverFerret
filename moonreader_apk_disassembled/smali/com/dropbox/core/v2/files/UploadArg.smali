.class Lcom/dropbox/core/v2/files/UploadArg;
.super Lcom/dropbox/core/v2/files/CommitInfo;
.source "UploadArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadArg$Serializer;,
        Lcom/dropbox/core/v2/files/UploadArg$Builder;
    }
.end annotation


# instance fields
.field protected final contentHash:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 9
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 99
    sget-object v2, Lcom/dropbox/core/v2/files/WriteMode;->ADD:Lcom/dropbox/core/v2/files/WriteMode;

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Lcom/dropbox/core/v2/files/UploadArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/WriteMode;ZLjava/util/Date;ZLjava/util/List;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/WriteMode;ZLjava/util/Date;ZLjava/util/List;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/WriteMode;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/util/Date;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p8    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/dropbox/core/v2/files/WriteMode;",
            "Z",
            "Ljava/util/Date;",
            "Z",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 74
    invoke-direct/range {p0 .. p7}, Lcom/dropbox/core/v2/files/CommitInfo;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/WriteMode;ZLjava/util/Date;ZLjava/util/List;Z)V

    move-object p1, p0

    if-eqz p8, :cond_2

    .line 76
    invoke-virtual {p8}, Ljava/lang/String;->length()I

    move-result p2

    const/16 p3, 0x40

    if-lt p2, p3, :cond_1

    .line 79
    invoke-virtual {p8}, Ljava/lang/String;->length()I

    move-result p2

    if-gt p2, p3, :cond_0

    goto :goto_0

    .line 80
    :cond_0
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "String \'contentHash\' is longer than 64"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 77
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    const-string p3, "String \'contentHash\' is shorter than 64"

    invoke-direct {p2, p3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 83
    :cond_2
    :goto_0
    iput-object p8, p1, Lcom/dropbox/core/v2/files/UploadArg;->contentHash:Ljava/lang/String;

    return-void
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/UploadArg$Builder;
    .locals 1

    .line 213
    new-instance v0, Lcom/dropbox/core/v2/files/UploadArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/UploadArg$Builder;-><init>(Ljava/lang/String;)V

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

    .line 397
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 398
    check-cast p1, Lcom/dropbox/core/v2/files/UploadArg;

    .line 399
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->path:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->path:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    if-eq v2, v3, :cond_3

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    .line 400
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/WriteMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->autorename:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->autorename:Z

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    if-eq v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    .line 402
    invoke-virtual {v2, v3}, Ljava/util/Date;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_4
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->mute:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->mute:Z

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    if-eq v2, v3, :cond_5

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    if-eqz v2, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    .line 404
    invoke-interface {v2, v3}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_5
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->strictConflict:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/UploadArg;->strictConflict:Z

    if-ne v2, v3, :cond_7

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadArg;->contentHash:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadArg;->contentHash:Ljava/lang/String;

    if-eq v2, p1, :cond_6

    if-eqz v2, :cond_7

    .line 406
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_7

    :cond_6
    return v0

    :cond_7
    return v1
.end method

.method public getAutorename()Z
    .locals 1

    .line 131
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->autorename:Z

    return v0
.end method

.method public getClientModified()Ljava/util/Date;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->clientModified:Ljava/util/Date;

    return-object v0
.end method

.method public getContentHash()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 197
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->contentHash:Ljava/lang/String;

    return-object v0
.end method

.method public getMode()Lcom/dropbox/core/v2/files/WriteMode;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 120
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->mode:Lcom/dropbox/core/v2/files/WriteMode;

    return-object v0
.end method

.method public getMute()Z
    .locals 1

    .line 158
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->mute:Z

    return v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getPropertyGroups()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/fileproperties/PropertyGroup;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 168
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->propertyGroups:Ljava/util/List;

    return-object v0
.end method

.method public getStrictConflict()Z
    .locals 1

    .line 183
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->strictConflict:Z

    return v0
.end method

.method public hashCode()I
    .locals 3

    .line 381
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadArg;->contentHash:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    invoke-static {v1}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    .line 384
    invoke-super {p0}, Lcom/dropbox/core/v2/files/CommitInfo;->hashCode()I

    move-result v1

    mul-int/lit8 v1, v1, 0x1f

    add-int/2addr v1, v0

    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 416
    sget-object v0, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 428
    sget-object v0, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
