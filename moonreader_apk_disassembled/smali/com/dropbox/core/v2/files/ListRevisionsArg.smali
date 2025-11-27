.class Lcom/dropbox/core/v2/files/ListRevisionsArg;
.super Ljava/lang/Object;
.source "ListRevisionsArg.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;,
        Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;
    }
.end annotation


# instance fields
.field protected final limit:J

.field protected final mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final path:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 80
    sget-object v0, Lcom/dropbox/core/v2/files/ListRevisionsMode;->PATH:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    const-wide/16 v1, 0xa

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/dropbox/core/v2/files/ListRevisionsArg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ListRevisionsMode;J)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/ListRevisionsMode;J)V
    .locals 1
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/ListRevisionsMode;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_4

    .line 50
    const-string v0, "/(.|[\\r\\n])*|id:.*|(ns:[0-9]+(/.*)?)"

    invoke-static {v0, p1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 53
    iput-object p1, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->path:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 57
    iput-object p2, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    const-wide/16 p1, 0x1

    cmp-long v0, p3, p1

    if-ltz v0, :cond_1

    const-wide/16 p1, 0x64

    cmp-long v0, p3, p1

    if-gtz v0, :cond_0

    .line 64
    iput-wide p3, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->limit:J

    return-void

    .line 62
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is larger than 100L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 59
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Number \'limit\' is smaller than 1L"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'mode\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 51
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "String \'path\' does not match pattern"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 48
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'path\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Ljava/lang/String;)Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;
    .locals 1

    .line 128
    new-instance v0, Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Builder;-><init>(Ljava/lang/String;)V

    return-object v0
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

    .line 239
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 240
    check-cast p1, Lcom/dropbox/core/v2/files/ListRevisionsArg;

    .line 241
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->path:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ListRevisionsArg;->path:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/ListRevisionsArg;->mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    if-eq v2, v3, :cond_3

    .line 242
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/ListRevisionsMode;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-wide v2, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->limit:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/files/ListRevisionsArg;->limit:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_4

    return v0

    :cond_4
    return v1
.end method

.method public getLimit()J
    .locals 2

    .line 112
    iget-wide v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->limit:J

    return-wide v0
.end method

.method public getMode()Lcom/dropbox/core/v2/files/ListRevisionsMode;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 102
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    return-object v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->path:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 222
    iget-object v0, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->path:Ljava/lang/String;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->mode:Lcom/dropbox/core/v2/files/ListRevisionsMode;

    iget-wide v2, p0, Lcom/dropbox/core/v2/files/ListRevisionsArg;->limit:J

    .line 225
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 222
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 253
    sget-object v0, Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 265
    sget-object v0, Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/ListRevisionsArg$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
