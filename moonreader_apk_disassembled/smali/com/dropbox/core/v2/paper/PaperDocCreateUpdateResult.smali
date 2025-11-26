.class public Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;
.super Ljava/lang/Object;
.source "PaperDocCreateUpdateResult.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;
    }
.end annotation


# instance fields
.field protected final docId:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final revision:J

.field protected final title:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;JLjava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 44
    iput-object p1, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->docId:Ljava/lang/String;

    .line 45
    iput-wide p2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->revision:J

    if-eqz p4, :cond_0

    .line 49
    iput-object p4, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->title:Ljava/lang/String;

    return-void

    .line 47
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'title\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 42
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'docId\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-nez p1, :cond_1

    return v1

    .line 100
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 101
    check-cast p1, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;

    .line 102
    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->docId:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->docId:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-wide v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->revision:J

    iget-wide v4, p1, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->revision:J

    cmp-long v6, v2, v4

    if-nez v6, :cond_4

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->title:Ljava/lang/String;

    iget-object p1, p1, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->title:Ljava/lang/String;

    if-eq v2, p1, :cond_3

    .line 104
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    :cond_3
    return v0

    :cond_4
    return v1
.end method

.method public getDocId()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 59
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->docId:Ljava/lang/String;

    return-object v0
.end method

.method public getRevision()J
    .locals 2

    .line 68
    iget-wide v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->revision:J

    return-wide v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 78
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->title:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 83
    iget-object v0, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->docId:Ljava/lang/String;

    iget-wide v1, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->revision:J

    .line 85
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iget-object v2, p0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult;->title:Ljava/lang/String;

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    const/4 v0, 0x2

    aput-object v2, v3, v0

    .line 83
    invoke-static {v3}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 114
    sget-object v0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 126
    sget-object v0, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;->INSTANCE:Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/paper/PaperDocCreateUpdateResult$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
