.class public Lcom/vladsch/flexmark/html/HtmlWriter;
.super Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
.source "HtmlWriter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase<",
        "Lcom/vladsch/flexmark/html/HtmlWriter;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field private useAttributes:Lcom/vladsch/flexmark/html/renderer/AttributablePart;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/Appendable;Z)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Lcom/vladsch/flexmark/util/html/FormattingAppendable;Ljava/lang/Appendable;Z)V

    .line 38
    iget-object p1, p1, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;II)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Ljava/lang/Appendable;II)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;IIZZ)V
    .locals 0

    .line 42
    invoke-direct {p0, p1, p2, p3}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;-><init>(Ljava/lang/Appendable;II)V

    .line 43
    invoke-virtual {p0, p4}, Lcom/vladsch/flexmark/html/HtmlWriter;->setSuppressOpenTagLine(Z)V

    .line 44
    invoke-virtual {p0, p5}, Lcom/vladsch/flexmark/html/HtmlWriter;->setSuppressCloseTagLine(Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method


# virtual methods
.method public getContext()Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    return-object v0
.end method

.method setContext(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 48
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    return-void
.end method

.method public srcPos()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method

.method public srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 2

    if-gt p1, p2, :cond_0

    .line 108
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionAttribute:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 109
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionAttribute:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "-"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-super {p0, v0, p1}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    :cond_0
    return-object p0
.end method

.method public srcPos(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 68
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    .line 70
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public srcPosWithEOL()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method

.method public srcPosWithEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 77
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result v0

    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p0
.end method

.method public srcPosWithTrailingEOL()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v0}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/util/ast/Node;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPosWithTrailingEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method

.method public srcPosWithTrailingEOL(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 4

    .line 85
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->isNotNull()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 86
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getEndOffset()I

    move-result v0

    .line 87
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object v1

    .line 89
    :goto_0
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 90
    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-eq v2, v3, :cond_0

    const/16 v3, 0x9

    if-eq v2, v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 95
    :cond_1
    :goto_1
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_2

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v2

    const/16 v3, 0xd

    if-ne v2, v3, :cond_2

    add-int/lit8 v0, v0, 0x1

    .line 99
    :cond_2
    invoke-interface {v1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    invoke-interface {v1, v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    if-ne v1, v2, :cond_3

    add-int/lit8 v0, v0, 0x1

    .line 102
    :cond_3
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->getStartOffset()I

    move-result p1

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->srcPos(II)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1

    :cond_4
    return-object p0
.end method

.method public tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 5

    .line 135
    iget-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->useAttributes:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    if-eqz v0, :cond_2

    .line 136
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->getAttributes()Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v2

    invoke-interface {v1, v0, v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->extendRenderingNodeAttributes(Lcom/vladsch/flexmark/html/renderer/AttributablePart;Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/Attributes;

    move-result-object v0

    .line 137
    iget-object v1, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getHtmlOptions()Lcom/vladsch/flexmark/html/HtmlRendererOptions;

    move-result-object v1

    iget-object v1, v1, Lcom/vladsch/flexmark/html/HtmlRendererOptions;->sourcePositionAttribute:Ljava/lang/String;

    .line 138
    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/util/html/Attributes;->getValue(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    .line 140
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const/16 v2, 0x2d

    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v4, 0x0

    .line 148
    :try_start_0
    invoke-virtual {v1, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    const/4 v4, -0x1

    :goto_0
    add-int/lit8 v2, v2, 0x1

    .line 153
    :try_start_1
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    move v1, v3

    move v3, v4

    goto :goto_1

    :catchall_1
    nop

    move v3, v4

    :cond_0
    const/4 v1, -0x1

    :goto_1
    if-ltz v3, :cond_1

    if-ge v3, v1, :cond_1

    .line 160
    iget-object v2, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-interface {v2}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v2

    sget-object v4, Lcom/vladsch/flexmark/html/HtmlRenderer;->TAG_RANGES:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v2, v4}, Lcom/vladsch/flexmark/util/ast/Document;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 161
    new-instance v4, Lcom/vladsch/flexmark/util/sequence/TagRange;

    invoke-direct {v4, p1, v3, v1}, Lcom/vladsch/flexmark/util/sequence/TagRange;-><init>(Ljava/lang/CharSequence;II)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 165
    :cond_1
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->setAttributes(Lcom/vladsch/flexmark/util/html/Attributes;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    const/4 v0, 0x0

    .line 166
    iput-object v0, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->useAttributes:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    .line 169
    :cond_2
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-object p0
.end method

.method public bridge synthetic tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 0

    .line 15
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1
.end method

.method public withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 115
    sget-object v0, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->NODE:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method

.method public withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 0

    .line 119
    invoke-super {p0}, Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;->withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 120
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlWriter;->useAttributes:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    return-object p0
.end method

.method public withAttr(Lcom/vladsch/flexmark/html/renderer/LinkStatus;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 1

    .line 125
    const-string v0, "Link Status"

    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/renderer/LinkStatus;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 126
    sget-object p1, Lcom/vladsch/flexmark/html/renderer/AttributablePart;->LINK:Lcom/vladsch/flexmark/html/renderer/AttributablePart;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/AttributablePart;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1
.end method

.method public withAttr(Lcom/vladsch/flexmark/html/renderer/ResolvedLink;)Lcom/vladsch/flexmark/html/HtmlWriter;
    .locals 0

    .line 130
    invoke-virtual {p1}, Lcom/vladsch/flexmark/html/renderer/ResolvedLink;->getStatus()Lcom/vladsch/flexmark/html/renderer/LinkStatus;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr(Lcom/vladsch/flexmark/html/renderer/LinkStatus;)Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendable;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic withAttr()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    return-object v0
.end method
