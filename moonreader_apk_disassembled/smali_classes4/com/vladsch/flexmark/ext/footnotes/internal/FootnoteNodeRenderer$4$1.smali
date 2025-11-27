.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;)V
    .locals 0

    .line 94
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 97
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v0, v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$200(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->getReferencedFootnoteBlocks()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    .line 98
    invoke-virtual {v1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;->getFootnoteOrdinal()I

    move-result v2

    .line 99
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "fn-"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "id"

    invoke-virtual {v3, v5, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->attr(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    .line 100
    iget-object v3, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;->this$1:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;

    iget-object v3, v3, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    invoke-virtual {v3}, Lcom/vladsch/flexmark/html/HtmlWriter;->withAttr()Lcom/vladsch/flexmark/html/HtmlWriter;

    move-result-object v3

    new-instance v4, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;

    invoke-direct {v4, p0, v1, v2}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1$1;-><init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$4$1;Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;I)V

    const-string v1, "li"

    invoke-virtual {v3, v1, v4}, Lcom/vladsch/flexmark/html/HtmlWriter;->tagIndent(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    goto :goto_0

    :cond_0
    return-void
.end method
