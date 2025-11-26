.class Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;
.super Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;
.source "ListBlockParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/core/ListBlockParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "BlockFactory"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final myOptions:Lcom/vladsch/flexmark/parser/ListOptions;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 448
    const-class v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    return-void
.end method

.method constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 452
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/parser/block/AbstractBlockParserFactory;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 453
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object p1

    iput-object p1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    return-void
.end method


# virtual methods
.method public tryStart(Lcom/vladsch/flexmark/parser/block/ParserState;Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;
    .locals 9

    .line 458
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/MatchedBlockParser;->getBlockParser()Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object p2

    .line 459
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/parser/ListOptions;->getParserEmulationProfile()Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->family:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    .line 460
    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->getNewItemCodeIndent()I

    move-result v1

    .line 462
    instance-of v2, p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v2, :cond_3

    .line 464
    check-cast p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    .line 466
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$000(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    if-ne v0, v2, :cond_2

    .line 467
    invoke-static {p2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$100(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    iget-object p2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {p2, v1, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object p2

    .line 470
    new-instance v0, Lcom/vladsch/flexmark/parser/core/ListItemParser;

    iget-object v1, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    invoke-direct {v0, v1, p1, p2}, Lcom/vladsch/flexmark/parser/core/ListItemParser;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;)V

    .line 474
    iget p1, p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerColumn:I

    iget-object v1, p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v1

    add-int/2addr p1, v1

    iget v1, p2, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    add-int/2addr p1, v1

    .line 475
    new-instance v1, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-direct {v1, v2, p2, v0}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;Lcom/vladsch/flexmark/parser/core/ListItemParser;)V

    .line 476
    new-array p2, v3, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object v1, p2, v5

    aput-object v0, p2, v6

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 477
    :cond_0
    invoke-static {p2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$200(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 479
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v0, v1, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v0

    .line 480
    new-instance v1, Lcom/vladsch/flexmark/parser/core/ListItemParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    invoke-direct {v1, v2, p1, v0}, Lcom/vladsch/flexmark/parser/core/ListItemParser;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;)V

    .line 484
    iget p1, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerColumn:I

    iget-object v2, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    add-int/2addr p1, v2

    iget v0, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    add-int/2addr p1, v0

    .line 485
    invoke-static {p2, v1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$302(Lcom/vladsch/flexmark/parser/core/ListBlockParser;Lcom/vladsch/flexmark/parser/core/ListItemParser;)Lcom/vladsch/flexmark/parser/core/ListItemParser;

    .line 487
    new-array p2, v6, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object v1, p2, v5

    invoke-static {p2}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 491
    :cond_1
    invoke-static {p2, v4}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$002(Lcom/vladsch/flexmark/parser/core/ListBlockParser;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 492
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 496
    :cond_2
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 499
    :cond_3
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v2

    new-array v7, v6, [Ljava/lang/Class;

    const-class v8, Lcom/vladsch/flexmark/ast/ListBlock;

    aput-object v8, v7, v5

    invoke-virtual {v2, v7}, Lcom/vladsch/flexmark/util/ast/Block;->getAncestorOfType([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/ast/ListBlock;

    if-eqz v2, :cond_4

    .line 501
    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/parser/block/ParserState;->getActiveBlockParser(Lcom/vladsch/flexmark/util/ast/Block;)Lcom/vladsch/flexmark/parser/block/BlockParser;

    move-result-object v2

    check-cast v2, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    .line 502
    invoke-static {v2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$000(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v7

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getLine()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v8

    if-ne v7, v8, :cond_4

    invoke-static {v2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$400(Lcom/vladsch/flexmark/parser/core/ListBlockParser;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 503
    invoke-static {v2, v4}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->access$002(Lcom/vladsch/flexmark/parser/core/ListBlockParser;Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 504
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 514
    :cond_4
    sget-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->COMMONMARK:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, v2, :cond_5

    .line 515
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    .line 516
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v2

    if-lt v0, v2, :cond_8

    .line 517
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 519
    :cond_5
    sget-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->FIXED_INDENT:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, v2, :cond_6

    .line 520
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    .line 521
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/ListOptions;->getCodeIndent()I

    move-result v2

    if-lt v0, v2, :cond_8

    .line 522
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 524
    :cond_6
    sget-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->KRAMDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, v2, :cond_7

    .line 525
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    .line 526
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemIndent()I

    move-result v2

    if-lt v0, v2, :cond_8

    .line 527
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 529
    :cond_7
    sget-object v2, Lcom/vladsch/flexmark/parser/ParserEmulationProfile;->MARKDOWN:Lcom/vladsch/flexmark/parser/ParserEmulationProfile;

    if-ne v0, v2, :cond_8

    .line 530
    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getIndent()I

    move-result v0

    .line 531
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v2}, Lcom/vladsch/flexmark/parser/ListOptions;->getItemIndent()I

    move-result v2

    if-lt v0, v2, :cond_8

    .line 532
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 536
    :cond_8
    iget-object v0, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-static {v0, v1, p1}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;->parseListMarker(Lcom/vladsch/flexmark/parser/ListOptions;ILcom/vladsch/flexmark/parser/block/ParserState;)Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;

    move-result-object v0

    if-eqz v0, :cond_b

    .line 539
    iget v1, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->markerColumn:I

    iget-object v2, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listMarker:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->contentOffset:I

    add-int/2addr v1, v2

    .line 541
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->isParagraphParser()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 542
    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    instance-of v4, v4, Lcom/vladsch/flexmark/ast/ListItem;

    if-eqz v4, :cond_9

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v4

    invoke-interface {p2}, Lcom/vladsch/flexmark/parser/block/BlockParser;->getBlock()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Block;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Block;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p2

    if-ne v4, p2, :cond_9

    const/4 p2, 0x1

    goto :goto_0

    :cond_9
    const/4 p2, 0x0

    :goto_0
    if-eqz v2, :cond_a

    .line 544
    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    iget-object v4, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->listBlock:Lcom/vladsch/flexmark/ast/ListBlock;

    iget-boolean v7, v0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;->isEmpty:Z

    invoke-virtual {v2, v4, v7, p2}, Lcom/vladsch/flexmark/parser/ListOptions;->canInterrupt(Lcom/vladsch/flexmark/ast/ListBlock;ZZ)Z

    move-result p2

    if-nez p2, :cond_a

    .line 545
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 548
    :cond_a
    new-instance p2, Lcom/vladsch/flexmark/parser/core/ListItemParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {p1}, Lcom/vladsch/flexmark/parser/block/ParserState;->getParsing()Lcom/vladsch/flexmark/ast/util/Parsing;

    move-result-object p1

    invoke-direct {p2, v2, p1, v0}, Lcom/vladsch/flexmark/parser/core/ListItemParser;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/ast/util/Parsing;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;)V

    .line 551
    new-instance p1, Lcom/vladsch/flexmark/parser/core/ListBlockParser;

    iget-object v2, p0, Lcom/vladsch/flexmark/parser/core/ListBlockParser$BlockFactory;->myOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-direct {p1, v2, v0, p2}, Lcom/vladsch/flexmark/parser/core/ListBlockParser;-><init>(Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/parser/core/ListBlockParser$ListData;Lcom/vladsch/flexmark/parser/core/ListItemParser;)V

    .line 552
    new-array v0, v3, [Lcom/vladsch/flexmark/parser/block/BlockParser;

    aput-object p1, v0, v5

    aput-object p2, v0, v6

    invoke-static {v0}, Lcom/vladsch/flexmark/parser/block/BlockStart;->of([Lcom/vladsch/flexmark/parser/block/BlockParser;)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/parser/block/BlockStart;->atColumn(I)Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1

    .line 555
    :cond_b
    invoke-static {}, Lcom/vladsch/flexmark/parser/block/BlockStart;->none()Lcom/vladsch/flexmark/parser/block/BlockStart;

    move-result-object p1

    return-object p1
.end method
