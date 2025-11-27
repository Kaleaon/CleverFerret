.class Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->renderDocument(Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/html/renderer/RenderingPhase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ext/footnotes/Footnote;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

.field final synthetic val$hadNewFootnotes:[Z


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;[Z)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->val$hadNewFootnotes:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V
    .locals 2

    .line 67
    invoke-virtual {p1}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->isDefined()Z

    move-result v0

    if-nez v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v0}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$200(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->getFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;)Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 71
    iget-object v1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->this$0:Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-static {v1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;->access$200(Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;)Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteRepository;->addFootnoteReference(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V

    .line 72
    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ext/footnotes/Footnote;->setFootnoteBlock(Lcom/vladsch/flexmark/ext/footnotes/FootnoteBlock;)V

    .line 73
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->val$hadNewFootnotes:[Z

    const/4 v0, 0x0

    const/4 v1, 0x1

    aput-boolean v1, p1, v0

    :cond_0
    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 64
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$3;->visit(Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V

    return-void
.end method
