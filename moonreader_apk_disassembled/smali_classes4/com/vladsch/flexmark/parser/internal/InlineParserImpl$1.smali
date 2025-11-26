.class final Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;
.super Ljava/lang/Object;
.source "InlineParserImpl.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;->calculateLinkRefProcessors(Lcom/vladsch/flexmark/util/options/DataHolder;Ljava/util/List;)Lcom/vladsch/flexmark/parser/internal/LinkRefProcessorData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$maxNestingLevelRef:[I

.field final synthetic val$options:Lcom/vladsch/flexmark/util/options/DataHolder;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;[I)V
    .locals 0

    .line 264
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$options:Lcom/vladsch/flexmark/util/options/DataHolder;

    iput-object p2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$maxNestingLevelRef:[I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;)I
    .locals 5

    .line 267
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I

    move-result v0

    .line 268
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {p2, v1}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getBracketNestingLevel(Lcom/vladsch/flexmark/util/options/DataHolder;)I

    move-result v1

    .line 269
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$maxNestingLevelRef:[I

    const/4 v3, 0x0

    aget v4, v2, v3

    if-ge v4, v0, :cond_0

    move v4, v0

    :cond_0
    if-ge v4, v1, :cond_1

    move v4, v1

    .line 272
    :cond_1
    aput v4, v2, v3

    if-ne v0, v1, :cond_3

    .line 276
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getWantExclamationPrefix(Lcom/vladsch/flexmark/util/options/DataHolder;)Z

    move-result p1

    if-nez p1, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 277
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->val$options:Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;->getWantExclamationPrefix(Lcom/vladsch/flexmark/util/options/DataHolder;)Z

    move-result p1

    if-nez p1, :cond_3

    add-int/lit8 v1, v1, 0x1

    .line 279
    :cond_3
    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 264
    check-cast p1, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    check-cast p2, Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl$1;->compare(Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;Lcom/vladsch/flexmark/parser/LinkRefProcessorFactory;)I

    move-result p1

    return p1
.end method
