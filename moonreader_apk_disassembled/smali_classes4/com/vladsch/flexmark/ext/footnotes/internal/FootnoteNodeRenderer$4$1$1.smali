.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

.field final synthetic val$footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

.field final synthetic val$footnoteOrdinal:I


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;I)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->val$footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    iput p3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->val$footnoteOrdinal:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .line 103
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->val$footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-interface {v0, v1}, Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 105
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->val$footnoteBlock:Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFootnoteReferences()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_2

    .line 107
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "#fnref-"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v5, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->val$footnoteOrdinal:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-nez v2, :cond_0

    const-string v5, ""

    goto :goto_1

    :cond_0
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v6, v7, v1

    const-string v6, "-%d"

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "href"

    invoke-virtual {v3, v5, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 108
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v3}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v3

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteBackLinkRefClass:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v4, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v4}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v4

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteBackLinkRefClass:Ljava/lang/String;

    const-string v5, "class"

    invoke-virtual {v3, v5, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 109
    :cond_1
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->line()Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    move-result-object v3

    check-cast v3, Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v3

    const-string v4, "a"

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 110
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v4, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v4}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v4

    iget-object v4, v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteBackRefString:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 111
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;->this$2:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v4, "/a"

    invoke-virtual {v3, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    :cond_2
    return-void
.end method
