.class public Lcom/dropbox/core/v2/files/SearchMatchV2;
.super Ljava/lang/Object;
.source "SearchMatchV2.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;,
        Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;
    }
.end annotation


# instance fields
.field protected final highlightSpans:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/HighlightSpan;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field protected final metadata:Lcom/dropbox/core/v2/files/MetadataV2;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/dropbox/core/v2/files/MetadataV2;)V
    .locals 1
    .param p1    # Lcom/dropbox/core/v2/files/MetadataV2;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 75
    invoke-direct {p0, p1, v0, v0}, Lcom/dropbox/core/v2/files/SearchMatchV2;-><init>(Lcom/dropbox/core/v2/files/MetadataV2;Lcom/dropbox/core/v2/files/SearchMatchTypeV2;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Lcom/dropbox/core/v2/files/MetadataV2;Lcom/dropbox/core/v2/files/SearchMatchTypeV2;Ljava/util/List;)V
    .locals 0
    .param p1    # Lcom/dropbox/core/v2/files/MetadataV2;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/dropbox/core/v2/files/SearchMatchTypeV2;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/dropbox/core/v2/files/MetadataV2;",
            "Lcom/dropbox/core/v2/files/SearchMatchTypeV2;",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/HighlightSpan;",
            ">;)V"
        }
    .end annotation

    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2

    .line 51
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    .line 52
    iput-object p2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    if-eqz p3, :cond_1

    .line 54
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/dropbox/core/v2/files/HighlightSpan;

    if-eqz p2, :cond_0

    goto :goto_0

    .line 56
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "An item in list \'highlightSpans\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 60
    :cond_1
    iput-object p3, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->highlightSpans:Ljava/util/List;

    return-void

    .line 49
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Required value for \'metadata\' is null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static newBuilder(Lcom/dropbox/core/v2/files/MetadataV2;)Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;
    .locals 1

    .line 121
    new-instance v0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;

    invoke-direct {v0, p0}, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;-><init>(Lcom/dropbox/core/v2/files/MetadataV2;)V

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

    .line 208
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 209
    check-cast p1, Lcom/dropbox/core/v2/files/SearchMatchV2;

    .line 210
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchMatchV2;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    if-eq v2, v3, :cond_2

    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/MetadataV2;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_2
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    iget-object v3, p1, Lcom/dropbox/core/v2/files/SearchMatchV2;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    if-eq v2, v3, :cond_3

    if-eqz v2, :cond_4

    .line 211
    invoke-virtual {v2, v3}, Lcom/dropbox/core/v2/files/SearchMatchTypeV2;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_3
    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->highlightSpans:Ljava/util/List;

    iget-object p1, p1, Lcom/dropbox/core/v2/files/SearchMatchV2;->highlightSpans:Ljava/util/List;

    if-eq v2, p1, :cond_5

    if-eqz v2, :cond_4

    .line 212
    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

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

.method public getHighlightSpans()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/HighlightSpan;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->highlightSpans:Ljava/util/List;

    return-object v0
.end method

.method public getMatchType()Lcom/dropbox/core/v2/files/SearchMatchTypeV2;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    return-object v0
.end method

.method public getMetadata()Lcom/dropbox/core/v2/files/MetadataV2;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    .line 85
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .line 191
    iget-object v0, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2;->highlightSpans:Ljava/util/List;

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

    .line 222
    sget-object v0, Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toStringMultiline()Ljava/lang/String;
    .locals 2

    .line 234
    sget-object v0, Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;->INSTANCE:Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, v1}, Lcom/dropbox/core/v2/files/SearchMatchV2$Serializer;->serialize(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
