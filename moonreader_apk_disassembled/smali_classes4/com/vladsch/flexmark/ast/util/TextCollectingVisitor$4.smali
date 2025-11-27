.class Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;
.super Ljava/lang/Object;
.source "TextCollectingVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ast/SoftLineBreak;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)V
    .locals 0

    .line 56
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->access$300(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;Lcom/vladsch/flexmark/ast/SoftLineBreak;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 56
    check-cast p1, Lcom/vladsch/flexmark/ast/SoftLineBreak;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$4;->visit(Lcom/vladsch/flexmark/ast/SoftLineBreak;)V

    return-void
.end method
