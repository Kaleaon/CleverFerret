.class Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;
.super Ljava/lang/Object;
.source "HeadingCollectingVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ast/Heading;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;)V
    .locals 0

    .line 14
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;->this$0:Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/Heading;)V
    .locals 1

    .line 16
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;->this$0:Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;

    invoke-static {v0}, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;->access$000(Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 14
    check-cast p1, Lcom/vladsch/flexmark/ast/Heading;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/HeadingCollectingVisitor$1;->visit(Lcom/vladsch/flexmark/ast/Heading;)V

    return-void
.end method
