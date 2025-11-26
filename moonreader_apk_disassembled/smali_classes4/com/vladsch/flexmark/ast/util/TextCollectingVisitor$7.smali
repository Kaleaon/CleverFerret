.class Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;
.super Lcom/vladsch/flexmark/util/ast/NodeVisitor;
.source "TextCollectingVisitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;-><init>([Ljava/lang/Class;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;


# direct methods
.method varargs constructor <init>(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;[Lcom/vladsch/flexmark/util/ast/VisitHandler;)V
    .locals 0

    .line 74
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-direct {p0, p2}, Lcom/vladsch/flexmark/util/ast/NodeVisitor;-><init>([Lcom/vladsch/flexmark/util/ast/VisitHandler;)V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 3

    .line 77
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->myCustomHandlersMap:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/ast/VisitHandler;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/ast/VisitHandler;->visit(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void

    .line 81
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->visitChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 82
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-static {v0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->access$600(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)Ljava/util/HashSet;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-static {v0}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->access$600(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)Ljava/util/HashSet;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, Lcom/vladsch/flexmark/util/ast/DoNotCollectText;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/ast/Node;->isOrDescendantOfType([Ljava/lang/Class;)Z

    move-result p1

    if-nez p1, :cond_1

    .line 83
    iget-object p1, p0, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor$7;->this$0:Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;

    invoke-static {p1}, Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;->access$700(Lcom/vladsch/flexmark/ast/util/TextCollectingVisitor;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    move-result-object p1

    const-string v0, "\n"

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;->append(Ljava/lang/String;)Lcom/vladsch/flexmark/util/sequence/SegmentedSequenceBuilder;

    :cond_1
    return-void
.end method
