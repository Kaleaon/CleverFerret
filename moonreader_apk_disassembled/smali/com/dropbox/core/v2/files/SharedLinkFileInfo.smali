.class public Lcom/dropbox/core/v2/files/SharedLinkFileInfo;
.super Ljava/lang/Object;
.source "SharedLinkFileInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;,
        Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Builder;
    }
.end annotation


# instance fields
.field protected final password:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final path:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final url:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 72
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
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

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 53
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->url:Ljava/lang/String;

    .line 54
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->path:Ljava/lang/String;

    .line 55
    iput-object p3, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->password:Ljava/lang/String;

    return-void

    .line 51
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'url\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Builder;
    .locals 1

    .line 123
    new-instance v0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Builder;-><init>(Ljava/lang/String;)V

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

    .line 201
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 202
    check-cast p1, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;

    .line 203
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->url:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->url:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->path:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_4

    .line 204
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->password:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->password:Ljava/lang/String;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 205
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    goto :goto_0

    :cond_4
    return v1

    :cond_5
    :goto_0
    return v0

    :cond_6
    return v1
.end method

.method public getPassword()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->password:Ljava/lang/String;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->path:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 184
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->url:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->path:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo;->password:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 215
    sget-object v0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 227
    sget-object v0, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SharedLinkFileInfo$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
