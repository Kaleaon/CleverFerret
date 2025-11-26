.class public Lcom/dropbox/core/v2/files/PaperCreateResult;
.super Ljava/lang/Object;
.source "PaperCreateResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;
    }
.end annotation


# instance fields
.field protected final fileId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final paperRevision:J

.field protected final resultPath:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final url:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 50
    iput-object p1, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->url:Ljava/lang/String;

    if-eqz p2, :cond_3

    .line 54
    iput-object p2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->resultPath:Ljava/lang/String;

    if-eqz p3, :cond_2

    .line 58
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result p1

    const/4 p2, 0x4

    if-lt p1, p2, :cond_1

    .line 61
    const-string p1, "id:.+"

    invoke-static {p1, p3}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 64
    iput-object p3, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->fileId:Ljava/lang/String;

    .line 65
    iput-wide p4, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->paperRevision:J

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileId\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 59
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'fileId\' is shorter than 4"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 56
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'fileId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 52
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'resultPath\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'url\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 6

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 127
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 128
    check-cast p1, Lcom/dropbox/core/v2/files/PaperCreateResult;

    .line 129
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->url:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperCreateResult;->url:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->resultPath:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperCreateResult;->resultPath:Ljava/lang/String;

    if-eq v2, v3, :cond_3

    .line 130
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->fileId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/PaperCreateResult;->fileId:Ljava/lang/String;

    if-eq v2, v3, :cond_4

    .line 131
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    :cond_4
    iget-wide v2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->paperRevision:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/PaperCreateResult;->paperRevision:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_5

    return v0

    :cond_5
    return v1
.end method

.method public getFileId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->fileId:Ljava/lang/String;

    return-object v0
.end method

.method public getPaperRevision()J
    .locals 2

    .line 104
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->paperRevision:J

    return-wide v0
.end method

.method public getResultPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->resultPath:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 75
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->url:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 6

    .line 109
    iget-object v0, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->url:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->resultPath:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->fileId:Ljava/lang/String;

    iget-wide v3, p0, Lcom/dropbox/core/v2/files/PaperCreateResult;->paperRevision:J

    .line 113
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

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

    .line 109
    invoke-static {v4}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 142
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 154
    sget-object v0, Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/PaperCreateResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
