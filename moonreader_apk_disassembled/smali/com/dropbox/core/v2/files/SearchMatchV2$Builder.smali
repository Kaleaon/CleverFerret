.class public Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;
.super Ljava/lang/Object;
.source "SearchMatchV2.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchMatchV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected highlightSpans:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/HighlightSpan;",
            ">;"
        }
    .end annotation
.end field

.field protected matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

.field protected final metadata:Lcom/dropbox/core/v2/files/MetadataV2;


# direct methods
.method protected constructor <init>(Lcom/dropbox/core/v2/files/MetadataV2;)V
    .locals 1

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    .line 137
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    const/4 p1, 0x0

    .line 138
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    .line 139
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->highlightSpans:Ljava/util/List;

    return-void

    .line 135
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'metadata\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/SearchMatchV2;
    .locals 4

    .line 185
    new-instance v0, Lcom/dropbox/core/v2/files/SearchMatchV2;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->metadata:Lcom/dropbox/core/v2/files/MetadataV2;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->highlightSpans:Ljava/util/List;

    invoke-direct {v0, v1, v2, v3}, Lcom/dropbox/core/v2/files/SearchMatchV2;-><init>(Lcom/dropbox/core/v2/files/MetadataV2;Lcom/dropbox/core/v2/files/SearchMatchTypeV2;Ljava/util/List;)V

    return-object v0
.end method

.method public withHighlightSpans(Ljava/util/List;)Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/dropbox/core/v2/files/HighlightSpan;",
            ">;)",
            "Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 168
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/dropbox/core/v2/files/HighlightSpan;

    if-eqz v1, :cond_0

    goto :goto_0

    .line 170
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "An item in list \'highlightSpans\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 174
    :cond_1
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->highlightSpans:Ljava/util/List;

    return-object p0
.end method

.method public withMatchType(Lcom/dropbox/core/v2/files/SearchMatchTypeV2;)Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;
    .locals 0

    .line 150
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchMatchV2$Builder;->matchType:Lcom/dropbox/core/v2/files/SearchMatchTypeV2;

    return-object p0
.end method
