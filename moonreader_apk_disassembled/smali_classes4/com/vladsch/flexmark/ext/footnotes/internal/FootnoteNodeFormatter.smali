.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;
.super Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;
.source "FootnoteNodeFormatter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter<",
        "Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;",
        "Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;",
        "Lcom/vladsch/flexmark/ext/footnotes/Footnote;",
        ">;"
    }
.end annotation


# static fields
.field public static final FOOTNOTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private final options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 15
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "FOOTNOTE_TRANSLATION_MAP"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->FOOTNOTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 19
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->FOOTNOTE_TRANSLATION_MAP:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-direct {p0, p1, v0}, Lcom/vladsch/flexmark/formatter/NodeRepositoryFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/util/options/DataKey;)V

    .line 20
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->render(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 81
    const-string v0, "[^"

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 82
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->isTransformingText()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 83
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->transformReferenceId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object p1

    .line 84
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;

    invoke-direct {v0, p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$3;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    goto :goto_0

    .line 91
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 93
    :goto_0
    const-string p1, "]"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 77
    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->renderReference(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method


# virtual methods
.method public getNodeClasses()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnotePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacement;->AS_IS:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnoteSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    sget-object v1, Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;->SORT_UNUSED_LAST:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 71
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getNodeFormattingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/formatter/NodeFormattingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 51
    new-instance v0, Ljava/util/HashSet;

    const/4 v1, 0x2

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    new-instance v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public getReferencePlacement()Lcom/vladsch/flexmark/util/format/options/ElementPlacement;
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnotePlacement:Lcom/vladsch/flexmark/util/format/options/ElementPlacement;

    return-object v0
.end method

.method public getReferenceSort()Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;
    .locals 1

    .line 35
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->options:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteFormatOptions;->footnoteSort:Lcom/vladsch/flexmark/util/format/options/ElementPlacementSort;

    return-object v0
.end method

.method public getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;
    .locals 1

    .line 25
    sget-object v0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteExtension;->FOOTNOTES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    return-object p1
.end method

.method public bridge synthetic getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/util/ast/NodeRepository;
    .locals 0

    .line 14
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->getRepository(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    move-result-object p1

    return-object p1
.end method

.method public renderReferenceBlock(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 40
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    const-string v1, "[^"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 41
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->transformReferenceId(Ljava/lang/String;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 42
    const-string v0, "]: "

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 43
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    const-string v1, "    "

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 44
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 45
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 46
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public bridge synthetic renderReferenceBlock(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 14
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeFormatter;->renderReferenceBlock(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
