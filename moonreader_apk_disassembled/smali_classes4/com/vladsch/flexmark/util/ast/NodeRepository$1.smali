.class Lcom/vladsch/flexmark/util/ast/NodeRepository$1;
.super Ljava/lang/Object;
.source "NodeRepository.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/util/ast/NodeRepository;->visitNodes(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/util/ValueRunnable;[Ljava/lang/Class;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/ast/NodeRepository;

.field final synthetic val$runnable:Lcom/vladsch/flexmark/util/ValueRunnable;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/ast/NodeRepository;Lcom/vladsch/flexmark/util/ValueRunnable;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository$1;->this$0:Lcom/vladsch/flexmark/util/ast/NodeRepository;

    iput-object p2, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository$1;->val$runnable:Lcom/vladsch/flexmark/util/ValueRunnable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/util/ast/NodeRepository$1;->val$runnable:Lcom/vladsch/flexmark/util/ValueRunnable;

    invoke-interface {v0, p1}, Lcom/vladsch/flexmark/util/ValueRunnable;->run(Ljava/lang/Object;)V

    return-void
.end method
