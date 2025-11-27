.class public Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;
.super Ljava/lang/Object;
.source "TableNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$Factory;
    }
.end annotation


# instance fields
.field private final intellijDummyIdentifier:Ljava/lang/String;

.field private final isIntellijDummyIdentifier:Z

.field private myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

.field private final options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

.field private final parserTrimCellWhiteSpace:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/util/format/TableFormatOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    .line 32
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->INTELLIJ_DUMMY_IDENTIFIER:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->isIntellijDummyIdentifier:Z

    if-eqz v0, :cond_0

    .line 33
    const-string v0, "\u001f"

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->intellijDummyIdentifier:Ljava/lang/String;

    .line 34
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/TablesExtension;->TRIM_CELL_WHITESPACE:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->parserTrimCellWhiteSpace:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$300(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$400(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$500(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$600(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method static synthetic access$700(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 228
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    .line 229
    new-array p2, p2, [Ljava/lang/Class;

    const-class v0, Lcom/vladsch/flexmark/ast/Paragraph;

    const/4 v1, 0x0

    aput-object v0, p2, v1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/ast/Text;->getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    .line 230
    instance-of v0, p2, Lcom/vladsch/flexmark/ast/Paragraph;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/vladsch/flexmark/ast/Paragraph;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/ast/Paragraph;->hasTableSeparator()Z

    move-result p2

    if-eqz p2, :cond_0

    .line 231
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->pushPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p2

    const-string p3, " "

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->addPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->popPrefix()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 233
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 236
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 12

    .line 97
    new-instance v0, Lcom/vladsch/flexmark/util/format/MarkdownTable;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;-><init>(Lcom/vladsch/flexmark/util/format/TableFormatOptions;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    .line 99
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$10;->$SwitchMap$com$vladsch$flexmark$formatter$RenderPurpose:[I

    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/RenderPurpose;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v2, 0x2

    if-eq v0, v2, :cond_2

    const/4 v3, 0x3

    if-eq v0, v3, :cond_2

    .line 110
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 113
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->tableManipulator:Lcom/vladsch/flexmark/util/format/TableManipulator;

    sget-object v0, Lcom/vladsch/flexmark/util/format/TableManipulator;->NULL:Lcom/vladsch/flexmark/util/format/TableManipulator;

    if-eq p2, v0, :cond_0

    .line 114
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->normalize()V

    .line 115
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-object p2, p2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->tableManipulator:Lcom/vladsch/flexmark/util/format/TableManipulator;

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-interface {p2, v0, p1}, Lcom/vladsch/flexmark/util/format/TableManipulator;->apply(Lcom/vladsch/flexmark/util/format/MarkdownTable;Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 118
    :cond_0
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getMaxColumns()I

    move-result p1

    if-lez p1, :cond_3

    .line 120
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 121
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1, p3}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->appendTable(Lcom/vladsch/flexmark/util/html/FormattingAppendable;)V

    .line 122
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 123
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean p1, p1, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->dumpIntellijOffsets:Z

    if-eqz p1, :cond_3

    .line 124
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->getTrackedOffsets()Ljava/util/Map;

    move-result-object p1

    .line 125
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result p2

    if-lez p2, :cond_3

    .line 126
    const-string p2, "\nTracked Offsets"

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 129
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    const-string v0, "  "

    const/4 v4, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Map$Entry;

    add-int/2addr v4, v1

    .line 131
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v5}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v9, v1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    invoke-interface {v5}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v11, 0x5

    new-array v11, v11, [Ljava/lang/Object;

    aput-object v7, v11, p2

    aput-object v8, v11, v1

    aput-object v9, v11, v2

    aput-object v10, v11, v3

    const/4 v7, 0x4

    aput-object v5, v11, v7

    const-string v5, "%d:[%d,%d] was:[%d,%d]"

    invoke-static {v6, v5, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 133
    const-string v0, " "

    goto :goto_0

    .line 134
    :cond_1
    const-string p1, "\n"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_1

    .line 103
    :cond_2
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 104
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 105
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->blankLine()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_3
    :goto_1
    const/4 p1, 0x0

    .line 140
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableBody;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 155
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 156
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setHeader(Z)V

    .line 157
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableCaption;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 2

    .line 170
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne v0, v1, :cond_0

    .line 171
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p2, p3, v0, p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setCaptionWithMarkers(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 174
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "dummy"

    goto :goto_0

    :cond_1
    const-string v0, ""

    .line 175
    :goto_0
    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequenceImpl;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    invoke-static {v0, v1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->formattedCaption(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/format/TableFormatOptions;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 178
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 179
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 180
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    :cond_2
    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 7

    .line 186
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_3

    .line 187
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    .line 188
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean p3, p3, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->trimCellWhitespace:Z

    if-eqz p3, :cond_1

    .line 189
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_0

    const/4 p3, 0x1

    .line 190
    invoke-interface {p2, v2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    goto :goto_0

    .line 192
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    :cond_1
    :goto_0
    move-object v2, p2

    .line 195
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    new-instance v0, Lcom/vladsch/flexmark/util/format/TableCell;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getSpan()I

    move-result v5

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object p3

    if-nez p3, :cond_2

    sget-object p1, Lcom/vladsch/flexmark/util/html/CellAlignment;->NONE:Lcom/vladsch/flexmark/util/html/CellAlignment;

    goto :goto_1

    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getAlignment()Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->cellAlignment()Lcom/vladsch/flexmark/util/html/CellAlignment;

    move-result-object p1

    :goto_1
    move-object v6, p1

    const/4 v4, 0x1

    invoke-direct/range {v0 .. v6}, Lcom/vladsch/flexmark/util/format/TableCell;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILcom/vladsch/flexmark/util/html/CellAlignment;)V

    invoke-virtual {p2, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->addCell(Lcom/vladsch/flexmark/util/format/TableCell;)V

    return-void

    .line 197
    :cond_3
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    const/16 v1, 0x7c

    if-nez v0, :cond_5

    .line 198
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 199
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    goto :goto_2

    .line 201
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getOpeningMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 204
    :goto_2
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator()Z

    move-result v0

    const/16 v3, 0x20

    const-string v4, " "

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean v0, v0, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-boolean v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->parserTrimCellWhiteSpace:Z

    if-eqz v0, :cond_7

    :cond_6
    invoke-virtual {p3, v3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 206
    :cond_7
    const-string v0, ""

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    .line 208
    new-instance v5, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;

    invoke-direct {v5, p0, p1, v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableCell;[Ljava/lang/String;)V

    invoke-interface {p2, v5}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    .line 216
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator()Z

    move-result p2

    if-nez p2, :cond_9

    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->spaceAroundPipes:Z

    if-eqz p2, :cond_9

    aget-object p2, v0, v2

    invoke-virtual {p2, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_8

    iget-boolean p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->parserTrimCellWhiteSpace:Z

    if-eqz p2, :cond_9

    :cond_8
    invoke-virtual {p3, v3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    .line 217
    :cond_9
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-nez p2, :cond_b

    .line 218
    iget-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->options:Lcom/vladsch/flexmark/util/format/TableFormatOptions;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/util/format/TableFormatOptions;->leadTrailPipes:Z

    if-eqz p2, :cond_a

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-interface {p2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result p2

    if-eqz p2, :cond_a

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(C)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 219
    :cond_a
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void

    .line 221
    :cond_b
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getClosingMarker()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->append(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableHead;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 144
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v0, 0x0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 145
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setHeader(Z)V

    .line 146
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableRow;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 161
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 162
    invoke-interface {p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object p1

    sget-object p2, Lcom/vladsch/flexmark/formatter/RenderPurpose;->FORMAT:Lcom/vladsch/flexmark/formatter/RenderPurpose;

    if-ne p1, p2, :cond_1

    .line 163
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->isSeparator()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->nextRow()V

    :cond_0
    return-void

    .line 165
    :cond_1
    invoke-virtual {p3}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->line()Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method

.method private render(Lcom/vladsch/flexmark/ext/tables/TableSeparator;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 150
    iget-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->myTable:Lcom/vladsch/flexmark/util/format/MarkdownTable;

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/util/format/MarkdownTable;->setSeparator(Z)V

    .line 151
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method


# virtual methods
.method public getNodeClasses()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Class<",
            "*>;>;"
        }
    .end annotation

    const/4 v0, 0x0

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

    .line 44
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x8

    new-array v1, v1, [Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableHead;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$2;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$3;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableBody;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$4;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableRow;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$5;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCell;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$6;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$7;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$7;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Text;

    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$8;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$8;-><init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V

    const/4 v3, 0x7

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method
