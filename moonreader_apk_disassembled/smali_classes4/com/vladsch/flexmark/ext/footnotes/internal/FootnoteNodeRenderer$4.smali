.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->renderDocument(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/RenderingPhase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

.field final synthetic val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;)V
    .locals 0

    .line 90
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$context:Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    const-string v1, "hr"

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagVoidLine(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v1, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;

    invoke-direct {v1, p0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;)V

    const-string v2, "ol"

    invoke-virtual {v0, v2, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
