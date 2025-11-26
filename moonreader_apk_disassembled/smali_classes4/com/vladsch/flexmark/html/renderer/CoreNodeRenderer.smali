.class public Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$Factory;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final CODE_CONTENT:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final LOOSE_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final PARAGRAPH_LINE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

.field public static final TIGHT_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;


# instance fields
.field private final codeContentBlock:Z

.field private final codeSoftLineBreaks:Z

.field private final listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

.field private myEOLs:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private myLines:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/Range;",
            ">;"
        }
    .end annotation
.end field

.field private myNextLine:I

.field private nextLineStartOffset:I

.field private final obfuscateEmail:Z

.field private final obfuscateEmailRandom:Z

.field private final recheckUndefinedReferences:Z

.field private final referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 38
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "LOOSE_LIST_ITEM"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->LOOSE_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 39
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "TIGHT_LIST_ITEM"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->TIGHT_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 40
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "PARAGRAPH_LINE"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->PARAGRAPH_LINE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 41
    new-instance v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    const-string v1, "FENCED_CODE_CONTENT"

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/html/renderer/AttributablePart;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->CODE_CONTENT:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    return-void
.end method

.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    .line 58
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->RECHECK_UNDEFINED_REFERENCES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->recheckUndefinedReferences:Z

    .line 59
    invoke-static {p1}, Lcom/vladsch/flexmark/parser/ListOptions;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/parser/ListOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    .line 60
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->OBFUSCATE_EMAIL:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->obfuscateEmail:Z

    .line 61
    sget-object v0, Lcom/vladsch/flexmark/html/HtmlRenderer;->OBFUSCATE_EMAIL_RANDOM:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->obfuscateEmailRandom:Z

    .line 62
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->FENCED_CODE_CONTENT_BLOCK:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    iput-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeContentBlock:Z

    .line 63
    sget-object v0, Lcom/vladsch/flexmark/parser/Parser;->CODE_SOFT_LINE_BREAKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeSoftLineBreaks:Z

    const/4 p1, 0x0

    .line 64
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myLines:Ljava/util/List;

    .line 65
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myEOLs:Ljava/util/List;

    const/4 p1, 0x0

    .line 66
    iput p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    .line 67
    iput p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    return-void
.end method

.method public static isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z
    .locals 0

    .line 769
    invoke-interface {p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-object p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressedLinks:Ljava/util/regex/Pattern;

    if-eqz p1, :cond_0

    .line 771
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 772
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private outputNextLineBreakSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V
    .locals 5

    .line 479
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myLines:Ljava/util/List;

    iget v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/Range;

    .line 480
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myEOLs:Ljava/util/List;

    iget v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 481
    iget v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    .line 484
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    iget v3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result v4

    sub-int/2addr v4, v1

    invoke-interface {v2, v3, v4}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    const-string v3, " \t"

    invoke-interface {v2, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countTrailing(Ljava/lang/CharSequence;)I

    move-result v2

    if-nez p3, :cond_0

    if-lez v2, :cond_0

    add-int/lit8 v2, v2, -0x1

    :cond_0
    add-int/2addr v1, v2

    .line 490
    iget p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result v2

    sub-int/2addr v2, v1

    invoke-virtual {p2, p3, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p2

    sget-object p3, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->PARAGRAPH_LINE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p2

    const-string p3, "span"

    invoke-virtual {p2, p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 491
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p2

    iput p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    .line 494
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p3

    iget v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result p1

    invoke-interface {p3, v0, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1, v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;)I

    move-result p1

    add-int/2addr p2, p1

    iput p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    return-void
.end method

.method private outputSourceLineSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 5

    .line 456
    invoke-virtual {p2}, Lcom/vladsch/flexmark/util/ast/Node;->getStartOffset()I

    move-result p2

    .line 457
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myLines:Ljava/util/List;

    iget v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/sequence/Range;

    .line 458
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myEOLs:Ljava/util/List;

    iget v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 461
    invoke-virtual {p3}, Lcom/vladsch/flexmark/util/ast/Node;->getEndOffset()I

    move-result p3

    .line 462
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result v2

    if-gt v2, p3, :cond_0

    .line 463
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result p3

    sub-int/2addr p3, v1

    .line 465
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1, p2, p3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    const-string v2, " \t"

    invoke-interface {v1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countTrailing(Ljava/lang/CharSequence;)I

    move-result v1

    sub-int/2addr p3, v1

    .line 466
    iget v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    .line 467
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getEnd()I

    move-result v1

    iput v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    .line 468
    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    iget v4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    invoke-virtual {p1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-interface {v3, v4, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->countLeading(Ljava/lang/CharSequence;)I

    move-result p1

    add-int/2addr v1, p1

    iput v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->nextLineStartOffset:I

    .line 471
    :cond_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result p1

    if-le p1, p2, :cond_1

    .line 472
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/sequence/Range;->getStart()I

    move-result p2

    .line 475
    :cond_1
    invoke-virtual {p4, p2, p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    sget-object p2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->PARAGRAPH_LINE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    const-string p2, "span"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private renderChildrenSourceLineWrapped(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 878
    invoke-interface {p3}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    if-eqz v0, :cond_1

    const-string v0, "\r\n"

    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->indexOfAny(Ljava/lang/CharSequence;)I

    move-result p2

    if-ltz p2, :cond_1

    .line 879
    iget p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    if-lez p2, :cond_0

    add-int/lit8 p2, p2, -0x1

    .line 880
    iput p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    .line 883
    :cond_0
    invoke-direct {p0, p1, p1, p1, p4}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->outputSourceLineSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 884
    invoke-interface {p3, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 885
    const-string p1, "/span"

    invoke-virtual {p4, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 887
    :cond_1
    invoke-interface {p3, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public static renderHtmlBlock(Lcom/vladsch/flexmark/ast/HtmlBlockBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZZ)V
    .locals 0

    if-eqz p3, :cond_0

    goto :goto_2

    .line 701
    :cond_0
    instance-of p3, p0, Lcom/vladsch/flexmark/ast/HtmlBlock;

    if-eqz p3, :cond_1

    .line 702
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_1
    if-eqz p3, :cond_2

    .line 704
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/HtmlBlockBase;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEOL()Ljava/lang/String;

    move-result-object p0

    if-eqz p5, :cond_3

    .line 707
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    :cond_3
    if-eqz p4, :cond_6

    if-eqz p3, :cond_5

    .line 712
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p4

    if-lez p4, :cond_4

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    invoke-virtual {p0, p4}, Ljava/lang/String;->charAt(I)C

    move-result p4

    const/16 p5, 0xa

    if-ne p4, p5, :cond_4

    .line 714
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    const/4 p5, 0x0

    invoke-virtual {p0, p5, p4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 716
    :cond_4
    const-string p4, "<p>"

    invoke-virtual {p2, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p4

    check-cast p4, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p4, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string p4, "</p>"

    invoke-virtual {p0, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 718
    :cond_5
    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 721
    :cond_6
    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :goto_1
    if-eqz p3, :cond_7

    .line 725
    invoke-interface {p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p0

    iget-boolean p0, p0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_7
    :goto_2
    return-void
.end method

.method public static renderInlineHtml(Lcom/vladsch/flexmark/ast/HtmlInlineBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZ)V
    .locals 0

    if-eqz p3, :cond_0

    return-void

    :cond_0
    if-eqz p4, :cond_1

    .line 749
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/HtmlInlineBase;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEOL()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 751
    :cond_1
    invoke-virtual {p0}, Lcom/vladsch/flexmark/ast/HtmlInlineBase;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p0

    invoke-interface {p0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEOL()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->rawPre(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private renderLineBreak(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)Z
    .locals 5

    .line 523
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myLines:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_7

    iget v2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v2, v0, :cond_7

    .line 525
    const-string v0, "span"

    invoke-virtual {p5, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->getOpenTagsAfterLast(Ljava/lang/CharSequence;)Ljava/util/List;

    move-result-object v0

    .line 526
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    if-eqz p2, :cond_0

    add-int/lit8 v4, v2, -0x1

    .line 527
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    if-nez v1, :cond_2

    .line 529
    invoke-virtual {p5}, Lcom/vladsch/flexmark/html/HtmlWriter;->isPendingSpace()Z

    move-result p2

    if-nez p2, :cond_2

    .line 531
    const-string p2, " "

    invoke-virtual {p5, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_2
    :goto_0
    add-int/lit8 p2, v2, -0x1

    if-lez v2, :cond_3

    .line 535
    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {p5, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->closeTag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move v2, p2

    goto :goto_0

    .line 538
    :cond_3
    const-string p2, "/span"

    invoke-virtual {p5, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    if-eqz v1, :cond_4

    .line 541
    invoke-virtual {p5, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 544
    :cond_4
    invoke-direct {p0, p3, p5, v1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->outputNextLineBreakSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    .line 546
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/String;

    if-nez v1, :cond_5

    .line 547
    invoke-interface {p4}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p3

    iget-object p3, p3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->inlineCodeSpliceClass:Ljava/lang/String;

    if-eqz p3, :cond_5

    invoke-interface {p4}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p3

    iget-object p3, p3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->inlineCodeSpliceClass:Ljava/lang/String;

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_5

    .line 548
    invoke-interface {p4}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p3

    iget-object p3, p3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->inlineCodeSpliceClass:Ljava/lang/String;

    const-string v0, "class"

    invoke-virtual {p5, v0, p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p3

    check-cast p3, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 550
    :cond_5
    invoke-virtual {p5, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    :cond_6
    return v3

    :cond_7
    return v1
.end method

.method private renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 3

    .line 409
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/parser/ListOptions;->isTightListItem(Lcom/vladsch/flexmark/ast/ListItem;)Z

    move-result v0

    const-string v1, "li"

    if-eqz v0, :cond_0

    .line 410
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->TIGHT_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withCondIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;

    invoke-direct {v2, p0, p3, p1, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$39;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    invoke-virtual {v0, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 418
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ListItem;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->LOOSE_LIST_ITEM:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$40;

    invoke-direct {v2, p0, p3, p1, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$40;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    invoke-virtual {v0, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method private renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 498
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->noPTagsUseBr:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 499
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    .line 500
    const-string p1, "br"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 502
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;

    invoke-direct {v1, p0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$42;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    const-string p1, "p"

    invoke-virtual {v0, p1, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 73
    new-instance v0, Ljava/util/HashSet;

    const/16 v1, 0x21

    new-array v1, v1, [Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/AutoLink;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$1;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x0

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BlockQuote;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$2;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x1

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BulletList;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$3;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$3;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x2

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Code;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$4;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$4;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x3

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/CodeBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$5;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$5;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x4

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/util/ast/Document;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$6;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$6;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x5

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Emphasis;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$7;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$7;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x6

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/FencedCodeBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$8;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$8;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/4 v3, 0x7

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HardLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$9;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$9;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x8

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Heading;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$10;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$10;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x9

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$11;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$11;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xa

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlCommentBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$12;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$12;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xb

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInnerBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$13;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$13;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xc

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$14;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$14;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xd

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlEntity;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$15;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$15;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xe

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInline;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$16;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0xf

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/HtmlInlineComment;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$17;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$17;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x10

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Image;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$18;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$18;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x11

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/ImageRef;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$19;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$19;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x12

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$20;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$20;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x13

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Link;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$21;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$21;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x14

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/LinkRef;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$22;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$22;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x15

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/BulletListItem;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$23;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$23;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x16

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/OrderedListItem;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$24;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$24;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x17

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/MailLink;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$25;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$25;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x18

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/OrderedList;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$26;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$26;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x19

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Paragraph;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$27;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$27;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1a

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Reference;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$28;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$28;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1b

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$29;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$29;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1c

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/StrongEmphasis;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$30;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$30;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1d

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/Text;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$31;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$31;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1e

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/TextBase;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$32;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$32;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x1f

    aput-object v2, v1, v3

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v3, Lcom/vladsch/flexmark/ast/ThematicBreak;

    new-instance v4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$33;

    invoke-direct {v4, p0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$33;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;)V

    invoke-direct {v2, v3, v4}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    const/16 v3, 0x20

    aput-object v2, v1, v3

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method render(Lcom/vladsch/flexmark/ast/AutoLink;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 4

    .line 779
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/AutoLink;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 780
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/AutoLink;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 783
    :cond_0
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

    const/4 v2, 0x0

    invoke-interface {p2, v1, v0, v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v1

    .line 784
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/AutoLink;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v2

    const-string v3, "www."

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p2

    iget-object p2, p2, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->autolinkWwwPrefix:Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object p2

    :goto_0
    const-string v2, "href"

    invoke-virtual {p1, v2, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 785
    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    new-instance p2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;

    invoke-direct {p2, p0, p3, v0}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/String;)V

    .line 786
    const-string p3, "a"

    const/4 v0, 0x0

    invoke-virtual {p1, p3, v0, v0, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 781
    :cond_2
    :goto_1
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/BlockQuote;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 311
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$36;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$36;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/BlockQuote;)V

    const-string p1, "blockquote"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLineIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 1

    .line 381
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$37;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$37;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/BulletList;)V

    const-string p1, "ul"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/BulletListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 401
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Code;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 4

    .line 624
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    .line 625
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlOpen:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v1, :cond_4

    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_1

    .line 644
    :cond_0
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlOpen:Ljava/lang/String;

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 645
    iget-boolean v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeSoftLineBreaks:Z

    if-eqz v1, :cond_2

    iget-boolean v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->isSoftBreakAllSpaces:Z

    if-nez v1, :cond_2

    .line 646
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/ast/Node;

    .line 647
    instance-of v3, v1, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v3, :cond_1

    .line 648
    invoke-virtual {v1}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-static {v1, v2}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_0

    .line 650
    :cond_1
    invoke-interface {p2, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 654
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 656
    :cond_3
    iget-object p1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->codeStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 626
    :cond_4
    :goto_1
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v3, "code"

    if-eqz v1, :cond_5

    .line 627
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_2

    .line 629
    :cond_5
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1, v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 631
    :goto_2
    iget-boolean v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeSoftLineBreaks:Z

    if-eqz v1, :cond_7

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->isSoftBreakAllSpaces:Z

    if-nez v0, :cond_7

    .line 632
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getChildren()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterable;->iterator()Lcom/vladsch/flexmark/util/collection/iteration/ReversiblePeekingIterator;

    move-result-object p1

    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/Node;

    .line 633
    instance-of v1, v0, Lcom/vladsch/flexmark/ast/Text;

    if-eqz v1, :cond_6

    .line 634
    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_3

    .line 636
    :cond_6
    invoke-interface {p2, v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->render(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_3

    .line 640
    :cond_7
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Code;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-static {p1, v2}, Lcom/vladsch/flexmark/util/html/Escaping;->collapseWhitespace(Ljava/lang/CharSequence;Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 642
    :cond_8
    const-string p1, "/code"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/CodeBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 372
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/CodeBlock;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object p2

    instance-of p2, p2, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;

    if-eqz p2, :cond_0

    .line 373
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/CodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimTailBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEndWithEOL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 375
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/CodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEOL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Emphasis;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 579
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    .line 580
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlOpen:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 589
    :cond_0
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlOpen:Ljava/lang/String;

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 590
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 591
    iget-object p1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->emphasisStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 581
    :cond_1
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "em"

    if-eqz v0, :cond_2

    .line 582
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 584
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Emphasis;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 586
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 587
    const-string p1, "/em"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/FencedCodeBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 4

    .line 320
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 321
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithTrailingEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "pre"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 323
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getInfo()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 324
    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v1

    const-string v2, "class"

    if-eqz v1, :cond_0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isBlank()Z

    move-result v0

    if-nez v0, :cond_0

    .line 325
    const-string v0, " "

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getInfoDelimitedByAny(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    .line 326
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v3

    iget-object v3, v3, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->languageClassPrefix:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_0

    .line 328
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->noLanguageClass:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 329
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 330
    invoke-virtual {p3, v2, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 334
    :cond_1
    :goto_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->CODE_CONTENT:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 335
    iget-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeContentBlock:Z

    if-eqz v0, :cond_2

    .line 336
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_1

    .line 338
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/FencedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEOL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 340
    :goto_1
    const-string p1, "/code"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 341
    const-string p1, "/pre"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 342
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-boolean p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HardLineBreak;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 569
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    if-eqz v0, :cond_0

    .line 570
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v2, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->hardBreak:Ljava/lang/String;

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    invoke-direct/range {v1 .. v6}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderLineBreak(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_0
    move-object v5, p2

    move-object v6, p3

    .line 574
    :cond_1
    invoke-interface {v5}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-object p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->hardBreak:Ljava/lang/String;

    invoke-virtual {v6, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 3

    .line 283
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->renderHeaderId:Z

    if-eqz v0, :cond_0

    .line 284
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getNodeId(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 286
    const-string v1, "id"

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 290
    :cond_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "h"

    if-eqz v0, :cond_1

    .line 291
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getLevel()I

    move-result v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;

    invoke-direct {v2, p0, p3, p1, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$34;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V

    invoke-virtual {v0, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 300
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Heading;->getLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$35;

    invoke-direct {v1, p0, p2, p1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$35;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/Heading;)V

    invoke-virtual {p3, v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagLine(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 8

    .line 662
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 663
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    .line 665
    iget-boolean v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourceWrapHtmlBlocks:Z

    if-eqz v1, :cond_0

    .line 666
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    sget-object v2, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE_POSITION:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    const-string v2, "div"

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->indent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 669
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlBlock;->hasChildren()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 671
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    move-object v4, p3

    goto :goto_0

    .line 673
    :cond_1
    iget-boolean v5, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlBlocks:Z

    iget-boolean v6, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlBlocks:Z

    const/4 v7, 0x0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    invoke-static/range {v2 .. v7}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderHtmlBlock(Lcom/vladsch/flexmark/ast/HtmlBlockBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZZ)V

    .line 676
    :goto_0
    iget-boolean p1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourceWrapHtmlBlocks:Z

    if-eqz p1, :cond_2

    .line 677
    invoke-virtual {v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->unIndent()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string p2, "/div"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 680
    :cond_2
    iget-boolean p1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    invoke-virtual {v4, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlCommentBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 685
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v4, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlCommentBlocks:Z

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v5, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlCommentBlocks:Z

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v1 .. v6}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderHtmlBlock(Lcom/vladsch/flexmark/ast/HtmlBlockBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZZ)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlEntity;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 761
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p2

    iget-boolean p2, p2, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->unescapeHtmlEntities:Z

    if-eqz p2, :cond_0

    .line 762
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 764
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescapeNoEntities()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlInline;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 734
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressInlineHtml:Z

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeInlineHtml:Z

    invoke-static {p1, p2, p3, v0, v1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderInlineHtml(Lcom/vladsch/flexmark/ast/HtmlInlineBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZ)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlInlineComment;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 742
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressInlineHtmlComments:Z

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeInlineHtmlComments:Z

    invoke-static {p1, p2, p3, v0, v1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderInlineHtml(Lcom/vladsch/flexmark/ast/HtmlInlineBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZ)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlInnerBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 690
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v4, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlBlocks:Z

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v5, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlBlocks:Z

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v1 .. v6}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderHtmlBlock(Lcom/vladsch/flexmark/ast/HtmlBlockBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZZ)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/HtmlInnerBlockComment;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 695
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v4, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->suppressHtmlCommentBlocks:Z

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v5, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->escapeHtmlCommentBlocks:Z

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v1 .. v6}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderHtmlBlock(Lcom/vladsch/flexmark/ast/HtmlBlockBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;ZZZ)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Image;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 5

    .line 823
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 824
    new-instance v0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Class;

    invoke-direct {v0, v1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collectAndGetText(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object v0

    .line 825
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/LinkType;->IMAGE:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-interface {p2, v1, v2, v3, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p2

    .line 826
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 828
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrlContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 830
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getUrlContent()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-static {v2}, Lcom/vladsch/flexmark/util/html/Escaping;->percentEncodeUrl(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "+"

    const-string v4, "%2B"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%3D"

    const-string v4, "="

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%26"

    const-string v4, "&amp;"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    .line 831
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 834
    :cond_0
    const-string v2, "src"

    invoke-virtual {p3, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 835
    const-string v1, "alt"

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 838
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    const-string v1, "title"

    if-eqz v0, :cond_1

    .line 839
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    .line 841
    :cond_1
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 844
    :goto_0
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 845
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Image;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    const-string p2, "img"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_2
    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/ImageRef;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 895
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->isDefined()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->recheckUndefinedReferences:Z

    if-eqz v0, :cond_0

    .line 896
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 897
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ImageRef;->setDefined(Z)V

    .line 903
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->isDefined()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_2

    .line 904
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/ImageRef;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object v0

    .line 905
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v3

    .line 906
    invoke-static {v3, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v4

    .line 908
    sget-object v5, Lcom/vladsch/flexmark/html/renderer/LinkType;->IMAGE:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-interface {p2, v5, v3, v1, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v1

    .line 909
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v3

    const-string v5, "title"

    if-eqz v3, :cond_1

    .line 910
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v3

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v6

    invoke-interface {v6}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_1

    .line 912
    :cond_1
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_1

    .line 916
    :cond_2
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->normalizeKey(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 917
    sget-object v3, Lcom/vladsch/flexmark/html/renderer/LinkType;->IMAGE_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-interface {p2, v3, v0, v1, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v0

    .line 918
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getStatus()Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    move-result-object v3

    sget-object v4, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    if-ne v3, v4, :cond_3

    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    :goto_0
    const/4 v4, 0x0

    :goto_1
    if-nez v1, :cond_4

    .line 925
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 927
    :cond_4
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v3

    if-nez v3, :cond_6

    if-nez v4, :cond_6

    .line 928
    new-instance v3, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    new-array v2, v2, [Ljava/lang/Class;

    invoke-direct {v3, v2}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V

    invoke-virtual {v3, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->collectAndGetText(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/String;

    move-result-object v2

    .line 929
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v3

    .line 931
    const-string v4, "src"

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p3, v4, v5}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 932
    const-string v4, "alt"

    invoke-virtual {p3, v4, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    if-eqz v0, :cond_5

    .line 936
    sget-object v2, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-interface {p2, v0, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v3

    .line 939
    :cond_5
    invoke-virtual {p3, v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 940
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ImageRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    const-string p2, "img"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoid(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_6
    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/IndentedCodeBlock;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 351
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 352
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "pre"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->openPre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 354
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->noLanguageClass:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 355
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 356
    const-string v1, "class"

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 359
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    sget-object v1, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->CODE_CONTENT:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "code"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 360
    iget-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->codeContentBlock:Z

    if-eqz v0, :cond_1

    .line 361
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    goto :goto_0

    .line 363
    :cond_1
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/IndentedCodeBlock;->getContentChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimTailBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->normalizeEndWithEOL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 365
    :goto_0
    const-string p1, "/code"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 366
    const-string p1, "/pre"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->closePre()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 367
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object p1

    iget-boolean p1, p1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->htmlBlockCloseTagEol:Z

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->lineIf(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Link;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 4

    .line 850
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 853
    :cond_0
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {p2, v0, v1, v2, v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v0

    .line 855
    const-string v1, "href"

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 858
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v1

    const-string v2, "title"

    if-eqz v1, :cond_1

    .line 859
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v3

    invoke-interface {v3}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_0

    .line 861
    :cond_1
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    .line 864
    :goto_0
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 865
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 866
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Link;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderChildrenSourceLineWrapped(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 867
    const-string p1, "/a"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 851
    :cond_2
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/LinkRef;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 6

    .line 949
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->isDefined()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->recheckUndefinedReferences:Z

    if-eqz v0, :cond_0

    .line 950
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 951
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/LinkRef;->setDefined(Z)V

    .line 956
    :cond_0
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->isDefined()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 957
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->referenceRepository:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/LinkRef;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object v0

    .line 958
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v2

    .line 959
    invoke-static {v2, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v3

    .line 961
    sget-object v4, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-interface {p2, v4, v2, v1, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v1

    .line 962
    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v2

    invoke-interface {v2}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v2

    const-string v4, "title"

    if-eqz v2, :cond_1

    .line 963
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v2

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ast/Reference;->getTitle()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v5

    invoke-interface {v5}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Lcom/vladsch/flexmark/util/html/Attributes;->replaceValue(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_1

    .line 965
    :cond_1
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/vladsch/flexmark/util/html/Attributes;->remove(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/Attribute;

    goto :goto_1

    .line 969
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getReference()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v0

    .line 970
    sget-object v2, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK_REF:Lcom/vladsch/flexmark/html/renderer/LinkType;

    invoke-interface {p2, v2, v0, v1, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Lcom/vladsch/flexmark/util/html/Attributes;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object v0

    .line 971
    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getStatus()Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    move-result-object v2

    sget-object v3, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->UNKNOWN:Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    const/4 v4, 0x0

    if-ne v2, v3, :cond_3

    move-object v0, v1

    goto :goto_0

    :cond_3
    move-object v3, v1

    move-object v1, v0

    move-object v0, v3

    :goto_0
    const/4 v3, 0x0

    :goto_1
    if-nez v1, :cond_5

    .line 979
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->hasChildren()Z

    move-result v0

    if-nez v0, :cond_4

    .line 980
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 982
    :cond_4
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->prefixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 983
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderChildrenSourceLineWrapped(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 984
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChildChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->suffixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 987
    :cond_5
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v2

    if-nez v2, :cond_8

    if-eqz v3, :cond_6

    goto :goto_2

    .line 990
    :cond_6
    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getNonNullAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v2

    .line 992
    const-string v3, "href"

    invoke-virtual {v1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p3, v3, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    if-eqz v0, :cond_7

    .line 995
    sget-object v3, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-interface {p2, v0, v3, v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v2

    .line 998
    :cond_7
    invoke-virtual {p3, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 999
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 1000
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/LinkRef;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderChildrenSourceLineWrapped(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/sequence/BasedSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 1001
    const-string p1, "/a"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 988
    :cond_8
    :goto_2
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/MailLink;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 6

    .line 796
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/MailLink;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-interface {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object v0

    .line 797
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->isDoNotRenderLinks()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/MailLink;->getUrl()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->isSuppressedLinkPrefix(Ljava/lang/CharSequence;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_0

    .line 800
    :cond_0
    sget-object v1, Lcom/vladsch/flexmark/html/renderer/LinkType;->LINK:Lcom/vladsch/flexmark/html/renderer/LinkType;

    const/4 v2, 0x0

    invoke-interface {p2, v1, v0, v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->resolveLink(Lcom/vladsch/flexmark/html/renderer/LinkType;Ljava/lang/CharSequence;Ljava/lang/Boolean;)Lcom/vladsch/flexmark/html/renderer/ResolvedLink;

    move-result-object p2

    .line 801
    iget-boolean v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->obfuscateEmail:Z

    const-string v2, "/a"

    const-string v3, "a"

    const-string v4, "mailto:"

    const-string v5, "href"

    if-eqz v1, :cond_1

    .line 802
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-boolean v4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->obfuscateEmailRandom:Z

    invoke-static {v1, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->obfuscate(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x1

    .line 803
    invoke-static {v0, v4}, Lcom/vladsch/flexmark/util/html/Escaping;->obfuscate(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    .line 805
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/MailLink;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1, v5, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 806
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    .line 807
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 808
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 809
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 811
    :cond_1
    invoke-virtual {p2}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getUrl()Ljava/lang/String;

    move-result-object v1

    .line 812
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/MailLink;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, v5, p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 813
    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    .line 814
    invoke-virtual {p1, v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 815
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/html/HtmlWriter;

    .line 816
    invoke-virtual {p1, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 798
    :cond_2
    :goto_0
    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/OrderedList;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 390
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/OrderedList;->getStartNumber()I

    move-result v0

    .line 391
    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/parser/ListOptions;->isOrderedListManualStart()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    const-string v1, "start"

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 392
    :cond_0
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance v0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$38;

    invoke-direct {v0, p0, p2, p1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$38;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/OrderedList;)V

    const-string p1, "ol"

    invoke-virtual {p3, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/OrderedListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 405
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderListItem(Lcom/vladsch/flexmark/ast/ListItem;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 4

    const/4 v0, 0x1

    .line 512
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/util/ast/NonRenderingInline;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/Paragraph;->getFirstChildAnyNot([Ljava/lang/Class;)Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 513
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    instance-of v0, v0, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    if-eqz v0, :cond_1

    .line 514
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getParent()Lcom/vladsch/flexmark/util/ast/Block;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->listOptions:Lcom/vladsch/flexmark/parser/ListOptions;

    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object v3

    invoke-interface {v0, p1, v1, v3}, Lcom/vladsch/flexmark/ast/ParagraphItemContainer;->isParagraphWrappingDisabled(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/parser/ListOptions;Lcom/vladsch/flexmark/util/options/DataHolder;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 517
    :cond_0
    invoke-virtual {p0, p1, p2, p3, v2}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V

    return-void

    .line 515
    :cond_1
    :goto_0
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderLooseParagraph(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    :cond_2
    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Reference;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/SoftLineBreak;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 7

    .line 559
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v2, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->softBreak:Ljava/lang/String;

    .line 560
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    if-eqz v0, :cond_2

    .line 561
    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\r\n"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "\r"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, "code"

    :goto_1
    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move-object v3, v0

    invoke-direct/range {v1 .. v6}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->renderLineBreak(Ljava/lang/String;Ljava/lang/String;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)Z

    move-result p1

    if-eqz p1, :cond_3

    return-void

    :cond_2
    move-object v6, p3

    .line 565
    :cond_3
    invoke-virtual {v6, v2}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/StrongEmphasis;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 2

    .line 597
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    .line 598
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlOpen:Ljava/lang/String;

    if-eqz v1, :cond_1

    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlClose:Ljava/lang/String;

    if-nez v1, :cond_0

    goto :goto_0

    .line 607
    :cond_0
    iget-object v1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlOpen:Ljava/lang/String;

    invoke-virtual {p3, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 608
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 609
    iget-object p1, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->strongEmphasisStyleHtmlClose:Ljava/lang/String;

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 599
    :cond_1
    :goto_0
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const-string v1, "strong"

    if-eqz v0, :cond_2

    .line 600
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_1

    .line 602
    :cond_2
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/StrongEmphasis;->getText()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p3, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 604
    :goto_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 605
    const-string p1, "/strong"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/Text;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 615
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Text;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->unescape()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/vladsch/flexmark/util/html/Escaping;->normalizeEOL(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/TextBase;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 620
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method render(Lcom/vladsch/flexmark/ast/ThematicBreak;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 347
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/ThematicBreak;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    const-string p2, "hr"

    invoke-virtual {p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method

.method render(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
    .locals 0

    .line 278
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method

.method public renderTextBlockParagraphLines(Lcom/vladsch/flexmark/ast/Paragraph;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Z)V
    .locals 2

    .line 429
    invoke-interface {p2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-boolean v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionParagraphLines:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 430
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->hasChildren()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 431
    new-instance p4, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;

    invoke-direct {p4}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;-><init>()V

    .line 432
    invoke-virtual {p4, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->collectAndGetRanges(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myLines:Ljava/util/List;

    .line 433
    invoke-virtual {p4}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->getEOLs()Ljava/util/List;

    move-result-object p4

    iput-object p4, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myEOLs:Ljava/util/List;

    .line 434
    iput v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->myNextLine:I

    .line 436
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/Paragraph;->getFirstChild()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object p4

    invoke-direct {p0, p1, p4, p1, p3}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->outputSourceLineSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/html/HtmlWriter;)V

    .line 437
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 438
    const-string p1, "/span"

    invoke-virtual {p3, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    :cond_0
    if-eqz p4, :cond_1

    .line 444
    invoke-virtual {p3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p3

    new-instance p4, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;

    invoke-direct {p4, p0, p2, p1}, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$41;-><init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/ast/Paragraph;)V

    const-string p1, "span"

    invoke-virtual {p3, p1, v1, v1, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;ZZLjava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void

    .line 451
    :cond_1
    invoke-interface {p2, p1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
