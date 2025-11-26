.class Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;
.super Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;
.source "Formatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatterContext;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SubNodeFormatter"
.end annotation


# instance fields
.field private final myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

.field final synthetic this$1:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 622
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->this$1:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    .line 623
    invoke-direct {p0, p3}, Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;-><init>(Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    .line 624
    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    return-void
.end method


# virtual methods
.method public customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 733
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->customPlaceholderFormat(Lcom/vladsch/flexmark/formatter/TranslationPlaceholderGenerator;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method

.method public getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;
    .locals 1

    .line 672
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getCurrentNode()Lcom/vladsch/flexmark/util/ast/Node;

    move-result-object v0

    return-object v0
.end method

.method public getDocument()Lcom/vladsch/flexmark/util/ast/Document;
    .locals 1

    .line 660
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getDocument()Lcom/vladsch/flexmark/util/ast/Document;

    move-result-object v0

    return-object v0
.end method

.method public getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;
    .locals 1

    .line 657
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getFormatterOptions()Lcom/vladsch/flexmark/formatter/internal/FormatterOptions;

    move-result-object v0

    return-object v0
.end method

.method public getFormattingPhase()Lcom/vladsch/flexmark/formatter/FormattingPhase;
    .locals 1

    .line 663
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getFormattingPhase()Lcom/vladsch/flexmark/formatter/FormattingPhase;

    move-result-object v0

    return-object v0
.end method

.method public getMarkdown()Lcom/vladsch/flexmark/formatter/MarkdownWriter;
    .locals 1

    .line 689
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-object v0
.end method

.method public getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;
    .locals 1

    .line 654
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getOptions()Lcom/vladsch/flexmark/util/options/DataHolder;

    move-result-object v0

    return-object v0
.end method

.method public getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;
    .locals 1

    .line 693
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getRenderPurpose()Lcom/vladsch/flexmark/formatter/RenderPurpose;

    move-result-object v0

    return-object v0
.end method

.method public getSubContext(Ljava/lang/Appendable;)Lcom/vladsch/flexmark/formatter/NodeFormatterContext;
    .locals 3

    .line 677
    new-instance v0, Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->markdown:Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    invoke-virtual {v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getOptions()I

    move-result v1

    invoke-direct {v0, p1, v1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;-><init>(Ljava/lang/Appendable;I)V

    .line 678
    invoke-virtual {v0, p0}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->setContext(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;)V

    .line 680
    new-instance p1, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;

    iget-object v1, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->this$1:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    iget-object v2, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-direct {p1, v1, v2, v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;-><init>(Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-object p1
.end method

.method public getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 1

    .line 629
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->getTranslationStore()Lcom/vladsch/flexmark/util/options/MutableDataHolder;

    move-result-object v0

    return-object v0
.end method

.method public isTransformingText()Z
    .locals 1

    .line 698
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->isTransformingText()Z

    move-result v0

    return v0
.end method

.method public final nodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 639
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->nodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;

    move-result-object p1

    return-object p1
.end method

.method public final nodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 634
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->nodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;

    move-result-object p1

    return-object p1
.end method

.method public nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 723
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->nonTranslatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method

.method public render(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 667
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V

    return-void
.end method

.method public renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 685
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p0}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->renderChildrenNode(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterSubContext;)V

    return-void
.end method

.method public final reversedNodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Ljava/lang/Class<",
            "*>;>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 650
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->reversedNodesOfType(Ljava/util/Collection;)Ljava/lang/Iterable;

    move-result-object p1

    return-object p1
.end method

.method public final reversedNodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/ast/Node;",
            ">;"
        }
    .end annotation

    .line 644
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->reversedNodesOfType([Ljava/lang/Class;)Ljava/lang/Iterable;

    move-result-object p1

    return-object p1
.end method

.method public transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 713
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->transformAnchorRef(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 703
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->transformNonTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 1

    .line 708
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->transformTranslating(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object p1

    return-object p1
.end method

.method public translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 728
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1, p2}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->translatingRefTargetSpan(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method

.method public translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V
    .locals 1

    .line 718
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter$SubNodeFormatter;->myMainNodeRenderer:Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/formatter/Formatter$MainNodeFormatter;->translatingSpan(Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;)V

    return-void
.end method
