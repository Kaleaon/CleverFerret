.class Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;
.super Ljava/lang/Object;
.source "ReferenceRepository.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ValueRunnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/ReferenceRepository;->getReferencedElements(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ValueRunnable<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

.field final synthetic val$references:Ljava/util/HashSet;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;Ljava/util/HashSet;)V
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;->this$0:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    iput-object p2, p0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;->val$references:Ljava/util/HashSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 1

    .line 45
    instance-of v0, p1, Lcom/vladsch/flexmark/ast/RefNode;

    if-eqz v0, :cond_0

    .line 46
    check-cast p1, Lcom/vladsch/flexmark/ast/RefNode;

    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;->this$0:Lcom/vladsch/flexmark/ast/util/ReferenceRepository;

    invoke-virtual {p1, v0}, Lcom/vladsch/flexmark/ast/RefNode;->getReferenceNode(Lcom/vladsch/flexmark/ast/util/ReferenceRepository;)Lcom/vladsch/flexmark/ast/Reference;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;->val$references:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public bridge synthetic run(Ljava/lang/Object;)V
    .locals 0

    .line 42
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/ReferenceRepository$1;->run(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
