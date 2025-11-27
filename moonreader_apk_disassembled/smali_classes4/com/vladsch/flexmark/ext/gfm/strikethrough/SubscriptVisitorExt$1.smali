.class final Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitorExt$1;
.super Ljava/lang/Object;
.source "SubscriptVisitorExt.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitorExt;->VISIT_HANDLERS(Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;)[Lcom/vladsch/flexmark/util/ast/VisitHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;)V
    .locals 0

    .line 9
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;)V
    .locals 1

    .line 12
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitorExt$1;->val$visitor:Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitor;->visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/SubscriptVisitorExt$1;->visit(Lcom/vladsch/flexmark/ext/gfm/strikethrough/Subscript;)V

    return-void
.end method
