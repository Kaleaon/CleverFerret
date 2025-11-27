.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->render(Lcom/vladsch/flexmark/ext/footnotes/Footnote;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

.field final synthetic val$footnoteOrdinal:I

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;I)V
    .locals 0

    .line 139
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput p3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$footnoteOrdinal:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 142
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v0

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteLinkRefClass:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v1

    iget-object v1, v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteLinkRefClass:Ljava/lang/String;

    const-string v2, "class"

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "#fn-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$footnoteOrdinal:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "href"

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 144
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v0}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v0

    const-string v1, "a"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 145
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v2

    iget-object v2, v2, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteRefPrefix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$footnoteOrdinal:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$300(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;

    move-result-object v2

    iget-object v2, v2, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteOptions;->footnoteRefSuffix:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->raw(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 146
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$5;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v1, "/a"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tag(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
