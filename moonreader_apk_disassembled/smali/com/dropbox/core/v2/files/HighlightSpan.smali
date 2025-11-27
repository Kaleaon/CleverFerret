.class public Lcom/dropbox/core/v2/files/HighlightSpan;
.super Ljava/lang/Object;
.source "HighlightSpan.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;
    }
.end annotation


# instance fields
.field protected final highlightStr:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field protected final isHighlighted:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 41
    iput-object p1, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->highlightStr:Ljava/lang/String;

    .line 42
    iput-boolean p2, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->isHighlighted:Z

    return-void

    .line 39
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'highlightStr\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
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

    .line 82
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 83
    check-cast p1, Lcom/dropbox/core/v2/files/HighlightSpan;

    .line 84
    iget-object v2, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->highlightStr:Ljava/lang/String;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/HighlightSpan;->highlightStr:Ljava/lang/String;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    iget-boolean v2, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->isHighlighted:Z

    iget-boolean p1, p1, Lcom/dropbox/core/v2/files/HighlightSpan;->isHighlighted:Z

    if-ne v2, p1, :cond_3

    return v0

    :cond_3
    return v1
.end method

.method public getHighlightStr()Ljava/lang/String;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->highlightStr:Ljava/lang/String;

    return-object v0
.end method

.method public getIsHighlighted()Z
    .locals 1

    .line 61
    iget-boolean v0, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->isHighlighted:Z

    return v0
.end method

.method public hashCode()I
    .locals 4

    .line 66
    iget-object v0, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->highlightStr:Ljava/lang/String;

    iget-boolean v1, p0, Lcom/dropbox/core/v2/files/HighlightSpan;->isHighlighted:Z

    .line 68
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    .line 66
    invoke-static {v2}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 95
    sget-object v0, Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 107
    sget-object v0, Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/HighlightSpan$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
