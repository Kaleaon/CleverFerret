.class final Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitorExt$1;
.super Ljava/lang/Object;
.source "StrikethroughVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;)V
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitor;->visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/StrikethroughVisitorExt$1;->visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Strikethrough;)V

    return-void
.end method
