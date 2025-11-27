.class public Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;
.super Ljava/lang/Object;
.source "TableParagraphPreProcessor.java"

# interfaces
.implements Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$TableSeparatorRow;
    }
.end annotation


# static fields
.field private static pipeCharacters:Ljava/util/BitSet;

.field private static pipeIntelliJNodeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;",
            ">;"
        }
    .end annotation
.end field

.field private static pipeNodeMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Character;",
            "Lcom/vladsch/flexmark/parser/block/CharacterNodeFactory;",
            ">;"
        }
    .end annotation
.end field

.field private static separatorCharacters:Ljava/util/BitSet;


# instance fields
.field TABLE_HEADER_SEPARATOR:Ljava/util/regex/Pattern;

.field private final options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 26
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeCharacters:Ljava/util/BitSet;

    .line 27
    new-instance v0, Ljava/util/BitSet;

    invoke-direct {v0}, Ljava/util/BitSet;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->separatorCharacters:Ljava/util/BitSet;

    .line 29
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeCharacters:Ljava/util/BitSet;

    const/16 v1, 0x7c

    .line 38
    invoke-static {v1}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v2

    .line 29
    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 31
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->separatorCharacters:Ljava/util/BitSet;

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 32
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->separatorCharacters:Ljava/util/BitSet;

    const/16 v1, 0x3a

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 33
    sget-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->separatorCharacters:Ljava/util/BitSet;

    const/16 v1, 0x2d

    invoke-virtual {v0, v1}, Ljava/util/BitSet;->set(I)V

    .line 36
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeNodeMap:Ljava/util/HashMap;

    .line 38
    new-instance v1, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$1;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$1;-><init>()V

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeIntelliJNodeMap:Ljava/util/HashMap;

    .line 64
    new-instance v1, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$2;

    invoke-direct {v1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$2;-><init>()V

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 140
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 141
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    .line 144
    iget p1, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->minSeparatorDashes:I

    const-string v0, ""

    invoke-static {p1, v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->getTableHeaderSeparator(ILjava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->TABLE_HEADER_SEPARATOR:Ljava/util/regex/Pattern;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$1;)V
    .locals 0

    .line 25
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-void
.end method

.method public static Factory()Lcom/vladsch/flexmark/parser/block/ParagraphPreProcessorFactory;
    .locals 1

    .line 89
    new-instance v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$3;

    invoke-direct {v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$3;-><init>()V

    return-object v0
.end method

.method private static getAlignment(ZZ)Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;
    .locals 0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    .line 480
    sget-object p0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->CENTER:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object p0

    :cond_0
    if-eqz p0, :cond_1

    .line 482
    sget-object p0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->LEFT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object p0

    :cond_1
    if-eqz p1, :cond_2

    .line 484
    sget-object p0, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;->RIGHT:Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static getTableHeaderSeparator(ILjava/lang/String;)Ljava/util/regex/Pattern;
    .locals 9

    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    move v1, p0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    const/4 v2, 0x2

    if-lt p0, v2, :cond_1

    add-int/lit8 v3, p0, -0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x1

    :goto_1
    const/4 v4, 0x3

    if-lt p0, v4, :cond_2

    sub-int/2addr p0, v2

    goto :goto_2

    :cond_2
    const/4 p0, 0x1

    .line 122
    :goto_2
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v1, v7, v8

    aput-object v6, v7, v0

    aput-object v3, v7, v2

    aput-object p0, v7, v4

    const-string p0, "(?:\\s*-{%d,}\\s*|\\s*:-{%d,}\\s*|\\s*-{%d,}:\\s*|\\s*:-{%d,}:\\s*)"

    invoke-static {v5, p0, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    .line 124
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    .line 125
    const-string v0, ""

    goto :goto_3

    :cond_3
    const-string v0, "\u001f"

    .line 126
    :goto_3
    const-string v1, "\\s"

    const-string v2, "?)"

    if-eqz p1, :cond_4

    move-object v3, v1

    goto :goto_4

    :cond_4
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "(?:\\s"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 127
    :goto_4
    const-string v4, "-"

    if-eqz p1, :cond_5

    move-object v5, v4

    goto :goto_5

    :cond_5
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "(?:-"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 128
    :goto_5
    const-string v6, "\\|"

    if-eqz p1, :cond_6

    move-object p1, v6

    goto :goto_6

    :cond_6
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v7, "(?:"

    invoke-direct {p1, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "?\\|"

    invoke-virtual {p1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 131
    :goto_6
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\\|?\\s*|"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\\|\\s*|\\|?(?:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\\|)+"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\\|?\\s*"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 135
    invoke-virtual {p0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v6, p1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 137
    invoke-static {p0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object p0

    return-object p0
.end method

.method private parseAlignment(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ")",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 422
    invoke-static {p1, v0, v0}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->split(Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZ)Ljava/util/List;

    move-result-object p1

    .line 423
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 424
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 425
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 426
    const-string v2, ":"

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 427
    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v1

    .line 428
    invoke-static {v3, v1}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->getAlignment(ZZ)Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    move-result-object v1

    .line 429
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method private static split(Lcom/vladsch/flexmark/util/sequence/BasedSequence;ZZ)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            "ZZ)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation

    .line 435
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    .line 436
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v0

    .line 437
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 439
    const-string v2, "|"

    invoke-interface {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    if-eqz p2, :cond_0

    .line 440
    invoke-interface {p0, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 441
    :cond_0
    invoke-interface {p0, v4, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    add-int/lit8 v0, v0, -0x1

    :cond_1
    const/4 v2, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_0
    if-ge v2, v0, :cond_8

    .line 449
    invoke-interface {p0, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v8

    if-eqz v6, :cond_2

    add-int/lit8 v5, v5, 0x1

    const/4 v6, 0x0

    goto :goto_1

    :cond_2
    const/16 v9, 0x5c

    if-eq v8, v9, :cond_7

    const/16 v9, 0x7c

    if-eq v8, v9, :cond_3

    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    if-eqz p1, :cond_4

    if-ge v7, v2, :cond_5

    .line 461
    :cond_4
    invoke-interface {p0, v7, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_5
    if-eqz p2, :cond_6

    add-int/lit8 v5, v2, 0x1

    .line 462
    invoke-interface {p0, v2, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_6
    add-int/lit8 v7, v2, 0x1

    const/4 v5, 0x0

    goto :goto_1

    :cond_7
    add-int/lit8 v5, v5, 0x1

    const/4 v6, 0x1

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_8
    if-lez v5, :cond_9

    .line 473
    invoke-interface {p0, v7, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-interface {v1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_9
    return-object v1
.end method


# virtual methods
.method cleanUpInlinedSeparators(Lcom/vladsch/flexmark/parser/InlineParser;Lcom/vladsch/flexmark/ext/tables/TableRow;Ljava/util/List;)Ljava/util/List;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/parser/InlineParser;",
            "Lcom/vladsch/flexmark/ext/tables/TableRow;",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 382
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move-object v2, v1

    move-object v3, v2

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/ast/Node;

    .line 383
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    if-eq v5, p2, :cond_0

    .line 385
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    instance-of v5, v5, Lcom/vladsch/flexmark/ast/WhiteSpace;

    if-eqz v5, :cond_1

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getPrevious()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v5

    goto :goto_1

    :cond_1
    move-object v5, v4

    .line 386
    :goto_1
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v6

    instance-of v6, v6, Lcom/vladsch/flexmark/ast/WhiteSpace;

    if-eqz v6, :cond_2

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getNext()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v6

    goto :goto_2

    :cond_2
    move-object v6, v4

    .line 388
    :goto_2
    new-instance v7, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result v9

    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result v10

    invoke-interface {v8, v9, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    invoke-direct {v7, v8}, Lcom/vladsch/flexmark/ast/Text;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 389
    invoke-virtual {v4, v7}, Lcom/vladsch/flexmark/util/ast/Node;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 390
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 391
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    .line 392
    invoke-virtual {v6}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    if-nez v3, :cond_3

    .line 395
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 396
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    move-object v11, v3

    move-object v3, v2

    move-object v2, v11

    .line 399
    :cond_3
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 400
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ast/Text;->getParent()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    if-eqz v2, :cond_7

    .line 405
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 406
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getLastChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-interface {p1, v2, v0}, Lcom/vladsch/flexmark/parser/InlineParser;->mergeTextNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_3

    .line 409
    :cond_5
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    if-ne p1, p2, :cond_6

    return-object v1

    .line 412
    :cond_6
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 413
    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    return-object p1

    :cond_7
    return-object p3
.end method

.method public preProcessBlock(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/block/ParserState;)I
    .locals 23

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    .line 158
    invoke-interface/range {p2 .. p2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getInlineParser()Lcom/vladsch/flexmark/parser/InlineParser;

    move-result-object v2

    .line 160
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v4, 0x0

    .line 163
    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndent(I)I

    move-result v5

    .line 165
    sget-object v6, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->separatorCharacters:Ljava/util/BitSet;

    .line 166
    sget-object v7, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeNodeMap:Ljava/util/HashMap;

    .line 169
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ast/Paragraph;->getContentLines()Ljava/util/List;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    const/4 v9, -0x1

    const/4 v11, -0x1

    const/4 v12, 0x0

    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_b

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 170
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ne v11, v9, :cond_0

    .line 171
    iget-object v10, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget v10, v10, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->maxHeaderRows:I

    if-le v15, v10, :cond_0

    return v4

    :cond_0
    const/16 v10, 0x7c

    .line 173
    invoke-interface {v13, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOf(C)I

    move-result v16

    if-gez v16, :cond_3

    if-ne v11, v9, :cond_1

    return v4

    .line 176
    :cond_1
    iget-object v8, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v8, v8, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->withCaption:Z

    if-eqz v8, :cond_b

    .line 177
    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    .line 178
    const-string v10, "["

    invoke-interface {v8, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->startsWith(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    const-string v10, "]"

    invoke-interface {v8, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->endsWith(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_2

    goto/16 :goto_4

    :cond_2
    const/4 v8, 0x0

    goto/16 :goto_4

    .line 185
    :cond_3
    invoke-virtual {v1, v15}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndent(I)I

    move-result v14

    if-gt v14, v5, :cond_4

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    goto :goto_1

    :cond_4
    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v14

    invoke-virtual {v1, v15}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndent(I)I

    move-result v17

    sub-int v17, v17, v5

    sub-int v14, v14, v17

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v17

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->eolLength()I

    move-result v18

    sub-int v10, v17, v18

    invoke-interface {v13, v14, v10}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    :goto_1
    if-ne v11, v9, :cond_9

    .line 187
    iget-object v10, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget v10, v10, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->minHeaderRows:I

    if-lt v15, v10, :cond_a

    iget-object v10, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->TABLE_HEADER_SEPARATOR:Ljava/util/regex/Pattern;

    .line 188
    invoke-virtual {v10, v13}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v10

    invoke-virtual {v10}, Ljava/util/regex/Matcher;->matches()Z

    move-result v10

    if-eqz v10, :cond_a

    .line 190
    invoke-interface {v14, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v10

    const/16 v9, 0x20

    if-eq v10, v9, :cond_5

    invoke-interface {v14, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v10

    const/16 v9, 0x9

    if-ne v10, v9, :cond_6

    goto :goto_2

    :cond_5
    const/16 v9, 0x9

    :goto_2
    invoke-interface {v13, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v10

    const/16 v9, 0x7c

    if-eq v10, v9, :cond_7

    :cond_6
    move-object v12, v13

    move v11, v15

    goto :goto_3

    .line 193
    :cond_7
    invoke-interface {v14, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x20

    if-eq v9, v10, :cond_8

    invoke-interface {v14, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v9

    const/16 v10, 0x9

    if-ne v9, v10, :cond_a

    :cond_8
    const/4 v9, 0x1

    .line 194
    invoke-virtual {v1, v9}, Lcom/vladsch/flexmark/ast/Paragraph;->setHasTableSeparator(Z)V

    goto :goto_3

    .line 197
    :cond_9
    iget-object v9, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v9, v9, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->multiLineRows:Z

    .line 201
    :cond_a
    :goto_3
    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const/4 v9, -0x1

    goto/16 :goto_0

    :cond_b
    const/4 v8, 0x0

    const/4 v9, -0x1

    :goto_4
    if-ne v11, v9, :cond_c

    return v4

    .line 207
    :cond_c
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 208
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :goto_5
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_13

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 209
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v14

    .line 211
    invoke-virtual {v1, v14}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndent(I)I

    move-result v15

    if-gt v15, v5, :cond_d

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v13

    const/16 v19, 0x0

    goto :goto_6

    :cond_d
    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v15

    invoke-virtual {v1, v14}, Lcom/vladsch/flexmark/ast/Paragraph;->getLineIndent(I)I

    move-result v17

    sub-int v17, v17, v5

    sub-int v15, v15, v17

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v17

    invoke-interface {v13}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->eolLength()I

    move-result v18

    const/16 v19, 0x0

    sub-int v4, v17, v18

    invoke-interface {v13, v15, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v13

    :goto_6
    if-ne v14, v11, :cond_e

    const/4 v4, 0x1

    goto :goto_7

    :cond_e
    const/4 v4, 0x0

    .line 213
    :goto_7
    new-instance v15, Lcom/vladsch/flexmark/ext/tables/TableRow;

    invoke-direct {v15, v13}, Lcom/vladsch/flexmark/ext/tables/TableRow;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    if-eqz v4, :cond_f

    .line 218
    new-instance v4, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$TableSeparatorRow;

    invoke-direct {v4, v13}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor$TableSeparatorRow;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 219
    invoke-interface {v2, v13, v4, v6, v7}, Lcom/vladsch/flexmark/parser/InlineParser;->parseCustom(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/BitSet;Ljava/util/Map;)Ljava/util/List;

    move-result-object v13

    .line 220
    invoke-virtual {v15, v4}, Lcom/vladsch/flexmark/ext/tables/TableRow;->takeChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    move/from16 v17, v5

    const/4 v4, 0x0

    goto :goto_9

    .line 224
    :cond_f
    sget-object v4, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeCharacters:Ljava/util/BitSet;

    move/from16 v17, v5

    sget-object v5, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->pipeNodeMap:Ljava/util/HashMap;

    invoke-interface {v2, v13, v15, v4, v5}, Lcom/vladsch/flexmark/parser/InlineParser;->parseCustom(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;Ljava/util/BitSet;Ljava/util/Map;)Ljava/util/List;

    move-result-object v13

    if-ge v14, v11, :cond_10

    add-int/lit8 v4, v14, 0x1

    goto :goto_8

    :cond_10
    sub-int v4, v14, v11

    :goto_8
    if-eqz v13, :cond_11

    .line 231
    invoke-virtual {v0, v2, v15, v13}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->cleanUpInlinedSeparators(Lcom/vladsch/flexmark/parser/InlineParser;Lcom/vladsch/flexmark/ext/tables/TableRow;Ljava/util/List;)Ljava/util/List;

    move-result-object v13

    :cond_11
    :goto_9
    if-nez v13, :cond_12

    if-gt v14, v11, :cond_14

    return v19

    .line 240
    :cond_12
    invoke-virtual {v15, v4}, Lcom/vladsch/flexmark/ext/tables/TableRow;->setRowNumber(I)V

    .line 241
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move/from16 v5, v17

    const/4 v4, 0x0

    goto :goto_5

    :cond_13
    const/16 v19, 0x0

    .line 245
    :cond_14
    new-instance v4, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v5

    const/4 v6, 0x0

    invoke-virtual {v3, v6, v5}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vladsch/flexmark/ext/tables/TableBlock;-><init>(Ljava/util/List;)V

    .line 246
    new-instance v5, Lcom/vladsch/flexmark/ext/tables/TableHead;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v3, v6, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-direct {v5, v3}, Lcom/vladsch/flexmark/ext/tables/TableHead;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 247
    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 249
    invoke-direct {v0, v12}, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->parseAlignment(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Ljava/util/List;

    move-result-object v3

    .line 252
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    .line 253
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/4 v9, 0x0

    :goto_a
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_29

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/vladsch/flexmark/ext/tables/TableRow;

    if-ne v9, v11, :cond_15

    .line 255
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    .line 256
    new-instance v5, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    invoke-direct {v5}, Lcom/vladsch/flexmark/ext/tables/TableSeparator;-><init>()V

    .line 257
    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_b

    :cond_15
    add-int/lit8 v12, v11, 0x1

    if-ne v9, v12, :cond_16

    .line 259
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    .line 260
    new-instance v5, Lcom/vladsch/flexmark/ext/tables/TableBody;

    invoke-direct {v5}, Lcom/vladsch/flexmark/ext/tables/TableBody;-><init>()V

    .line 261
    invoke-virtual {v4, v5}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 266
    :cond_16
    :goto_b
    new-instance v12, Lcom/vladsch/flexmark/util/ast/NodeIterator;

    invoke-virtual {v10}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v13

    invoke-direct {v12, v13}, Lcom/vladsch/flexmark/util/ast/NodeIterator;-><init>(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 267
    new-instance v13, Lcom/vladsch/flexmark/ext/tables/TableRow;

    invoke-virtual {v10}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    invoke-direct {v13, v14}, Lcom/vladsch/flexmark/ext/tables/TableRow;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 268
    invoke-virtual {v10}, Lcom/vladsch/flexmark/ext/tables/TableRow;->getRowNumber()I

    move-result v10

    invoke-virtual {v13, v10}, Lcom/vladsch/flexmark/ext/tables/TableRow;->setRowNumber(I)V

    const/4 v10, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    .line 271
    :goto_c
    invoke-virtual {v12}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_24

    move-object/from16 v17, v7

    if-lt v10, v6, :cond_17

    .line 272
    iget-object v7, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v7, v7, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->discardExtraColumns:Z

    if-eqz v7, :cond_17

    .line 273
    iget-object v7, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v7, v7, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->headerSeparatorColumnMatch:Z

    if-eqz v7, :cond_25

    if-ge v9, v11, :cond_25

    const/16 v19, 0x0

    return v19

    .line 282
    :cond_17
    new-instance v7, Lcom/vladsch/flexmark/ext/tables/TableCell;

    invoke-direct {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;-><init>()V

    move-object/from16 v18, v12

    if-eqz v14, :cond_18

    .line 284
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v12

    instance-of v12, v12, Lcom/vladsch/flexmark/ext/tables/internal/TableColumnSeparator;

    if-eqz v12, :cond_18

    .line 285
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v12

    .line 286
    invoke-virtual {v12}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    invoke-virtual {v7, v14}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setOpeningMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 287
    invoke-virtual {v12}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    const/4 v14, 0x0

    :cond_18
    add-int v12, v10, v15

    if-ge v12, v6, :cond_19

    .line 291
    invoke-interface {v3, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    goto :goto_d

    :cond_19
    const/4 v12, 0x0

    :goto_d
    move/from16 v20, v14

    if-ge v9, v11, :cond_1a

    const/4 v14, 0x1

    goto :goto_e

    :cond_1a
    const/4 v14, 0x0

    .line 292
    :goto_e
    invoke-virtual {v7, v14}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setHeader(Z)V

    .line 293
    invoke-virtual {v7, v12}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setAlignment(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)V

    .line 296
    :goto_f
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_1c

    .line 297
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v12

    instance-of v12, v12, Lcom/vladsch/flexmark/ext/tables/internal/TableColumnSeparator;

    if-eqz v12, :cond_1b

    goto :goto_10

    .line 298
    :cond_1b
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v12

    invoke-virtual {v7, v12}, Lcom/vladsch/flexmark/ext/tables/TableCell;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_f

    :cond_1c
    :goto_10
    const/4 v12, 0x1

    const/4 v14, 0x0

    .line 304
    :goto_11
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_21

    move/from16 v21, v15

    .line 305
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v15

    instance-of v15, v15, Lcom/vladsch/flexmark/ext/tables/internal/TableColumnSeparator;

    if-nez v15, :cond_1d

    goto :goto_13

    :cond_1d
    if-nez v14, :cond_1f

    .line 307
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v14

    invoke-virtual {v14}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    .line 308
    iget-object v15, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v15, v15, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->columnSpans:Z

    if-nez v15, :cond_1e

    goto :goto_13

    :cond_1e
    :goto_12
    move/from16 v15, v21

    goto :goto_11

    .line 310
    :cond_1f
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->peek()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v15

    invoke-virtual {v15}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v15

    .line 312
    invoke-interface {v14, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isContinuedBy(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z

    move-result v22

    if-nez v22, :cond_20

    goto :goto_13

    .line 313
    :cond_20
    invoke-interface {v14, v15}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->spliceAtEnd(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    .line 314
    invoke-virtual/range {v18 .. v18}, Lcom/vladsch/flexmark/util/ast/NodeIterator;->next()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v15

    invoke-virtual {v15}, Lcom/vladsch/flexmark/util/ast/Node;->unlink()V

    add-int/lit8 v12, v12, 0x1

    goto :goto_12

    :cond_21
    move/from16 v21, v15

    :goto_13
    add-int/lit8 v15, v12, -0x1

    add-int v15, v21, v15

    if-eqz v14, :cond_22

    .line 321
    invoke-virtual {v7, v14}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setClosingMarker(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 322
    :cond_22
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    invoke-virtual {v7, v14}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setChars(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 324
    iget-object v14, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v14, v14, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->trimCellWhitespace:Z

    if-eqz v14, :cond_23

    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;->trimWhiteSpace()V

    goto :goto_14

    .line 325
    :cond_23
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;->mergeWhiteSpace()V

    .line 328
    :goto_14
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;->getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v14

    invoke-virtual {v7, v14}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setText(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 330
    invoke-virtual {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setCharsFromContent()V

    .line 331
    invoke-virtual {v7, v12}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setSpan(I)V

    .line 332
    invoke-virtual {v13, v7}, Lcom/vladsch/flexmark/ext/tables/TableRow;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    add-int/lit8 v10, v10, 0x1

    move-object/from16 v7, v17

    move-object/from16 v12, v18

    move/from16 v14, v20

    goto/16 :goto_c

    :cond_24
    move-object/from16 v17, v7

    .line 336
    :cond_25
    iget-object v7, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v7, v7, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->headerSeparatorColumnMatch:Z

    if-eqz v7, :cond_26

    if-ge v9, v11, :cond_26

    if-ge v10, v6, :cond_26

    const/16 v19, 0x0

    return v19

    .line 341
    :cond_26
    :goto_15
    iget-object v7, v0, Lcom/vladsch/flexmark/ext/tables/internal/TableParagraphPreProcessor;->options:Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;

    iget-boolean v7, v7, Lcom/vladsch/flexmark/ext/tables/internal/TableParserOptions;->appendMissingColumns:Z

    if-eqz v7, :cond_28

    if-ge v10, v6, :cond_28

    .line 342
    new-instance v7, Lcom/vladsch/flexmark/ext/tables/TableCell;

    invoke-direct {v7}, Lcom/vladsch/flexmark/ext/tables/TableCell;-><init>()V

    if-ge v9, v11, :cond_27

    const/4 v12, 0x1

    goto :goto_16

    :cond_27
    const/4 v12, 0x0

    .line 343
    :goto_16
    invoke-virtual {v7, v12}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setHeader(Z)V

    .line 344
    invoke-interface {v3, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;

    invoke-virtual {v7, v12}, Lcom/vladsch/flexmark/ext/tables/TableCell;->setAlignment(Lcom/vladsch/flexmark/ext/tables/TableCell$Alignment;)V

    .line 345
    invoke-virtual {v13, v7}, Lcom/vladsch/flexmark/ext/tables/TableRow;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    add-int/lit8 v10, v10, 0x1

    goto :goto_15

    .line 349
    :cond_28
    invoke-virtual {v13}, Lcom/vladsch/flexmark/ext/tables/TableRow;->setCharsFromContent()V

    .line 350
    invoke-virtual {v5, v13}, Lcom/vladsch/flexmark/util/ast/Node;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v7, v17

    goto/16 :goto_a

    .line 355
    :cond_29
    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->setCharsFromContent()V

    .line 357
    instance-of v3, v5, Lcom/vladsch/flexmark/ext/tables/TableSeparator;

    if-eqz v3, :cond_2a

    .line 358
    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableBody;

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-virtual {v5}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v5

    invoke-interface {v6, v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-direct {v3, v5}, Lcom/vladsch/flexmark/ext/tables/TableBody;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 359
    invoke-virtual {v4, v3}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    :cond_2a
    if-eqz v8, :cond_2b

    .line 364
    new-instance v3, Lcom/vladsch/flexmark/ext/tables/TableCaption;

    const/4 v6, 0x0

    const/4 v9, 0x1

    invoke-interface {v8, v6, v9}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v6

    sub-int/2addr v6, v9

    invoke-interface {v8, v9, v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-interface {v8}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v7

    sub-int/2addr v7, v9

    invoke-interface {v8, v7}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    invoke-direct {v3, v5, v6, v7}, Lcom/vladsch/flexmark/ext/tables/TableCaption;-><init>(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)V

    .line 365
    invoke-virtual {v3}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v2, v5, v3}, Lcom/vladsch/flexmark/parser/InlineParser;->parse(Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 366
    invoke-virtual {v3}, Lcom/vladsch/flexmark/ext/tables/TableCaption;->setCharsFromContent()V

    .line 367
    invoke-virtual {v4, v3}, Lcom/vladsch/flexmark/util/ast/Block;->appendChild(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 370
    :cond_2b
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->setCharsFromContent()V

    .line 372
    invoke-virtual {v1, v4}, Lcom/vladsch/flexmark/ast/Paragraph;->insertBefore(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object/from16 v1, p2

    .line 373
    invoke-interface {v1, v4}, Lcom/vladsch/flexmark/parser/block/ParserState;->blockAdded(Lcom/vladsch/flexmark/util/ast/Block;)V

    .line 374
    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    return v1
.end method
