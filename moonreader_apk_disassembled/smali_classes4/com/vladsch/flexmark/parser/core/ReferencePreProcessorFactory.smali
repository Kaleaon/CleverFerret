.class public Lcom/vladsch/flexmark/parser/core/ReferencePreProcessorFactory;
.super Ljava/lang/Object;
.source "ReferencePreProcessorFactory.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public affectsGlobalScope()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public create(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;
    .locals 0

    .line 28
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getInlineParser()Lcom/vladsch/flexmark/parser/InlineParser;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/parser/internal/InlineParserImpl;

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 10
    check-cast p1, Lcom/vladsch/flexmark/parser/block/ParserState;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/parser/core/ReferencePreProcessorFactory;->create(Lcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;

    move-result-object p1

    return-object p1
.end method

.method public getAfterDependents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getBeforeDependents()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "+",
            "Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;",
            ">;>;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method
