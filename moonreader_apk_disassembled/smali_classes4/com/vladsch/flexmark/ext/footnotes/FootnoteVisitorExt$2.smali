.class final Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitorExt$2;
.super Ljava/lang/Object;
.source "FootnoteVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;)V
    .locals 0

    .line 15
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitorExt$2;->val$visitor:Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V
    .locals 1

    .line 18
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitorExt$2;->val$visitor:Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitor;->visit(Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 15
    check-cast p1, Lcom/vladsch/flexmark/ext/footnotes/Footnote;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/footnotes/FootnoteVisitorExt$2;->visit(Lcom/vladsch/flexmark/ext/footnotes/Footnote;)V

    return-void
.end method
