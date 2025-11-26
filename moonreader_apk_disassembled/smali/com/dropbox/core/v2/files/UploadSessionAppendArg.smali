.class Lcom/dropbox/core/v2/files/UploadSessionAppendArg;
.super Ljava/lang/Object;
.source "UploadSessionAppendArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;,
        Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;
    }
.end annotation


# instance fields
.field protected final close:Z

.field protected final contentHash:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;)V
    .locals 2
    .param p1    # Lcom/dropbox/core/v2/files/UploadSessionCursor;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 80
    invoke-direct {p0, p1, v0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;ZLjava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;ZLjava/lang/String;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/UploadSessionCursor;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_3

    .line 55
    iput-object p1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    .line 56
    iput-boolean p2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->close:Z

    if-eqz p3, :cond_2

    .line 58
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    const/16 p2, 0x40

    if-lt p1, p2, :cond_1

    .line 61
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    if-gt p1, p2, :cond_0

    goto :goto_0

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is longer than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 59
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'contentHash\' is shorter than 64"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 65
    :cond_2
    :goto_0
    iput-object p3, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->contentHash:Ljava/lang/String;

    return-void

    .line 53
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'cursor\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/files/UploadSessionCursor;)Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;
    .locals 1

    .line 132
    new-instance v0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Builder;-><init>(Lcom/dropbox/core/v2/files/UploadSessionCursor;)V

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

    .line 235
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 236
    check-cast p1, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;

    .line 237
    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/UploadSessionCursor;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->close:Z

    iget-boolean v3, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->close:Z

    if-ne v2, v3, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->contentHash:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->contentHash:Ljava/lang/String;

    if-eq v2, p1, :cond_3

    if-eqz v2, :cond_4

    .line 239
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method public getClose()Z
    .locals 1

    .line 103
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->close:Z

    return v0
.end method

.method public getContentHash()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->contentHash:Ljava/lang/String;

    return-object v0
.end method

.method public getCursor()Lcom/dropbox/core/v2/files/UploadSessionCursor;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 218
    iget-object v0, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->cursor:Lcom/dropbox/core/v2/files/UploadSessionCursor;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->close:Z

    .line 220
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg;->contentHash:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 218
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 249
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 261
    sget-object v0, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/UploadSessionAppendArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
