.class public Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;
.super Ljava/lang/Object;
.source "TranslationHandlerImpl.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslationHandler;


# instance fields
.field private myAnchorId:I

.field final myAnchorTexts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

.field private myIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

.field final myIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;

.field private myNonTranslatingSpanId:I

.field final myNonTranslatingSpans:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myNonTranslatingTexts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myOriginalAnchors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myOriginalRefTargets:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field final myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

.field private myPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

.field private myPlaceholderId:I

.field private myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

.field final myTranslatedAnchors:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslatedRefTargets:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslatedSpans:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslatedTexts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslatingPlaceholders:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private myTranslatingSpanId:I

.field final myTranslatingSpans:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslatingTexts:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field final myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataSet;

.field private myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;)V
    .locals 0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 42
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    .line 43
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    .line 44
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    .line 45
    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    .line 52
    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    .line 53
    iput-object p3, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;

    .line 54
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingTexts:Ljava/util/HashMap;

    .line 55
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorTexts:Ljava/util/HashMap;

    .line 56
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingTexts:Ljava/util/HashMap;

    .line 57
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    .line 58
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myOriginalAnchors:Ljava/util/HashMap;

    .line 59
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedAnchors:Ljava/util/HashMap;

    .line 60
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedRefTargets:Ljava/util/HashMap;

    .line 61
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myOriginalRefTargets:Ljava/util/HashMap;

    .line 62
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    .line 63
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    .line 64
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingPlaceholders:Ljava/util/ArrayList;

    .line 65
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpans:Ljava/util/ArrayList;

    .line 66
    iget-object p1, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationExcludePattern:Ljava/lang/String;

    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

    .line 67
    new-instance p1, Lcom/vladsch/flexmark/util/options/MutableDataSet;

    invoke-direct {p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-void
.end method

.method public static addPrefixSuffix(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 1

    if-nez p1, :cond_0

    if-nez p2, :cond_0

    if-nez p3, :cond_0

    .line 352
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 354
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz p1, :cond_1

    .line 355
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 356
    :cond_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    if-eqz p2, :cond_2

    .line 357
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    :cond_2
    if-eqz p3, :cond_3

    .line 358
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 359
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static isBlank(Ljava/lang/CharSequence;)Z
    .locals 4

    .line 84
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    .line 86
    invoke-interface {p0, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;
    .locals 3

    .line 239
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 241
    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getContext()Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    move-result-object v2

    invoke-interface {v2, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getSubContext(Ljava/lang/Appendable;)Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    move-result-object v0

    .line 242
    invoke-interface {v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getMarkdown()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v2

    .line 243
    iput-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 245
    invoke-interface {p1, v0, v2}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 247
    invoke-virtual {v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getPendingEOL()I

    move-result p1

    const/4 v0, -0x1

    .line 248
    invoke-virtual {v2, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->flush(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 249
    invoke-virtual {v2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getText()Ljava/lang/String;

    move-result-object v0

    .line 251
    iput-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    if-eqz p2, :cond_1

    .line 253
    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    const/4 p2, 0x1

    if-ne p1, p2, :cond_0

    .line 255
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object v0

    .line 257
    :cond_0
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    sub-int/2addr p1, p2

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine(I)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_1
    return-object v0
.end method


# virtual methods
.method public beginRendering(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 78
    iput-object p3, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 79
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGeneratorFactory:Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGeneratorFactory;->create()Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    move-result-object p2

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    .line 80
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->generateIds(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-void
.end method

.method public customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 2

    .line 225
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->TRANSLATED_SPANS:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-eq v0, v1, :cond_0

    .line 226
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    .line 227
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    .line 228
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getContext()Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    move-result-object p1

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p2, p1, v1}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 229
    iput-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    :cond_0
    return-void
.end method

.method public getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 345
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderGenerator:Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;

    if-eqz v0, :cond_0

    invoke-interface {v0, p2}, Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;->getPlaceholder(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    if-nez p3, :cond_1

    if-nez p4, :cond_1

    if-nez p5, :cond_1

    return-object p1

    .line 348
    :cond_1
    invoke-static {p1, p3, p4, p5}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->addPrefixSuffix(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    return-object v0
.end method

.method public getTranslatingTexts()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingPlaceholders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingPlaceholders:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 95
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 99
    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingTexts:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    .line 100
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {v4}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-virtual {v4, v5}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->matches()Z

    move-result v4

    if-nez v4, :cond_0

    .line 102
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 104
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 105
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    iget-object v4, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingPlaceholders:Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 111
    :cond_1
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    .line 112
    invoke-static {v2}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/regex/Matcher;->matches()Z

    move-result v3

    if-nez v3, :cond_2

    .line 113
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method public bridge synthetic getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 22
    invoke-virtual {p0}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object v0

    return-object v0
.end method

.method public getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 1

    .line 72
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslationStore:Lcom/vladsch/flexmark/util/options/MutableDataSet;

    return-object v0
.end method

.method public isTransformingText()Z
    .locals 2

    .line 177
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 6

    .line 310
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl$1;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_2

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 340
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getContext()Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p1, v0, v1}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    .line 333
    :cond_0
    invoke-direct {p0, p1, v2}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    .line 334
    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    return-void

    .line 324
    :cond_1
    invoke-direct {p0, p1, v1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    .line 325
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpans:Ljava/util/ArrayList;

    iget v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 326
    iget v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    .line 327
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 312
    :cond_2
    invoke-direct {p0, p1, v1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    move-result-object p1

    .line 314
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 315
    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    .line 317
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 318
    iget-object v1, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method public setRenderPurpose(Lcom/vladsch/flexmark/formatter/RenderPurpose;)V
    .locals 1

    const/4 v0, 0x0

    .line 163
    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    .line 164
    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    .line 165
    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    .line 166
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    .line 167
    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingSpanId:I

    return-void
.end method

.method public setTranslatedTexts(Ljava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/CharSequence;",
            ">;)V"
        }
    .end annotation

    .line 122
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 123
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingTexts:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->putAll(Ljava/util/Map;)V

    .line 124
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 125
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    .line 129
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 130
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingPlaceholders:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 131
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 133
    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingTexts:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 134
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-static {v5}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/CharSequence;

    invoke-virtual {v5, v6}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->matches()Z

    move-result v5

    if-nez v5, :cond_0

    .line 135
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    if-nez v5, :cond_2

    if-lt v3, v0, :cond_1

    goto :goto_1

    .line 139
    :cond_1
    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    iget-object v5, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 143
    :cond_2
    iget-object v6, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/CharSequence;

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 150
    :cond_3
    :goto_1
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/CharSequence;

    .line 151
    invoke-static {v1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->isBlank(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_4

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceHolderMarkerPattern:Ljava/util/regex/Pattern;

    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-nez v2, :cond_4

    .line 152
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 156
    :cond_4
    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_5
    return-void
.end method

.method public transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 4

    .line 182
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl$1;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_5

    const/4 v3, 0x2

    if-eq v0, v3, :cond_4

    const/4 v3, 0x3

    if-eq v0, v3, :cond_0

    goto :goto_0

    .line 192
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v0, v0, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget v3, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    add-int/2addr v3, v2

    iput v3, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 193
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingTexts:Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_2

    .line 195
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    if-nez p1, :cond_2

    .line 197
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorTexts:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_3

    .line 200
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myOriginalRefTargets:Ljava/util/HashMap;

    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    if-eqz p2, :cond_1

    .line 203
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedRefTargets:Ljava/util/HashMap;

    invoke-virtual {v0, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p2, :cond_1

    return-object p2

    :cond_1
    return-object p1

    .line 211
    :cond_2
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorTexts:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-eqz p1, :cond_3

    return-object p1

    :cond_3
    :goto_0
    return-object p2

    .line 189
    :cond_4
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    add-int/2addr p2, v2

    iput p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    new-array v0, v2, [Ljava/lang/Object;

    aput-object p2, v0, v1

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 184
    :cond_5
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorId:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v1

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 185
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myAnchorTexts:Ljava/util/HashMap;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 8

    .line 364
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl$1;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_3

    const/4 p1, 0x3

    if-eq v0, p1, :cond_0

    goto :goto_0

    .line 382
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-lez p1, :cond_2

    .line 383
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingTexts:Ljava/util/HashMap;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    if-nez p1, :cond_1

    .line 386
    const-string p1, ""

    :cond_1
    return-object p1

    :cond_2
    :goto_0
    return-object p2

    .line 379
    :cond_3
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v3, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    add-int/lit8 v4, p2, 0x1

    iput v4, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    move-object v2, p0

    move-object v5, p1

    move-object v6, p3

    move-object v7, p4

    invoke-virtual/range {v2 .. v7}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    move-object v0, v2

    return-object p1

    :cond_4
    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v7, p4

    if-eqz v7, :cond_5

    move-object v5, v7

    goto :goto_1

    .line 371
    :cond_5
    invoke-static {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 372
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p4

    move-object v5, p4

    .line 374
    :goto_1
    iget-object p1, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget p3, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    add-int/lit8 v2, p3, 0x1

    iput v2, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 375
    iget-object p3, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myNonTranslatingTexts:Ljava/util/HashMap;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 8

    .line 400
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl$1;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_6

    const/4 v2, 0x2

    if-eq v0, v2, :cond_5

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_1

    :cond_0
    if-nez p1, :cond_1

    if-nez p3, :cond_1

    if-nez p4, :cond_1

    move-object v0, p2

    goto :goto_0

    .line 410
    :cond_1
    invoke-static {p2, p1, p3, p4}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->addPrefixSuffix(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 411
    :goto_0
    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedTexts:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_3

    if-nez p1, :cond_2

    if-nez p3, :cond_2

    if-eqz p4, :cond_3

    .line 413
    :cond_2
    invoke-static {v0, p1, p3, p4}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->addPrefixSuffix(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_3
    if-eqz v0, :cond_4

    return-object v0

    :cond_4
    :goto_1
    return-object p2

    .line 407
    :cond_5
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object v3, p2, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    add-int/lit8 v4, p2, 0x1

    iput v4, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    move-object v2, p0

    move-object v5, p1

    move-object v6, p3

    move-object v7, p4

    invoke-virtual/range {v2 .. v7}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    move-object v0, v2

    return-object p1

    :cond_6
    move-object v0, p0

    move-object v3, p1

    move-object v4, p3

    move-object v5, p4

    .line 402
    iget-object p1, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myFormatterOptions:Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    iget-object p1, p1, Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;->translationIdFormat:Ljava/lang/String;

    iget p3, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    add-int/lit8 v2, p3, 0x1

    iput v2, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myPlaceholderId:I

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->getPlaceholderId(Ljava/lang/String;ILjava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 403
    iget-object p3, v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingTexts:Ljava/util/HashMap;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p1
.end method

.method public translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 3

    .line 265
    sget-object v0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl$1;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myRenderPurpose:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_4

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_0

    .line 305
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getContext()Lcom/vladsch/flexmark/formatter/NodeFormatterContext;

    move-result-object p1

    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-interface {p2, p1, v0}, Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;->render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void

    :cond_0
    if-eqz p1, :cond_1

    .line 296
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->getId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object p1

    .line 297
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedRefTargets:Ljava/util/HashMap;

    iget v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    :cond_1
    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    .line 300
    invoke-direct {p0, p2, v1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 279
    invoke-direct {p0, p2, v0}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    .line 281
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedSpans:Ljava/util/ArrayList;

    iget v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-eqz p1, :cond_3

    .line 284
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->getId(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 285
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatedRefTargets:Ljava/util/HashMap;

    iget v2, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 288
    :cond_3
    iget p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    add-int/2addr p1, v1

    iput p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpanId:I

    .line 290
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myWriter:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 267
    :cond_4
    invoke-direct {p0, p2, v1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->renderInSubContext(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;Z)Ljava/lang/String;

    move-result-object p2

    if-eqz p1, :cond_5

    .line 269
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myIdGenerator:Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/html/renderer/HtmlIdGenerator;->getId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object p1

    .line 270
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myOriginalRefTargets:Ljava/util/HashMap;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 273
    :cond_5
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->myTranslatingSpans:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    const/4 v0, 0x0

    .line 235
    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/formatter/internal/TranslationHandlerImpl;->translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method
