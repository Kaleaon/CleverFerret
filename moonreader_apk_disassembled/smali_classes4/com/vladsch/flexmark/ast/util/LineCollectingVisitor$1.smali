.class Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;
.super Ljava/lang/Object;
.source "LineCollectingVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/ast/Visitor;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/ast/Visitor<",
        "Lcom/vladsch/flexmark/ast/Text;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;)V
    .locals 0

    .line 24
    iput-object p1, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;->this$0:Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public visit(Lcom/vladsch/flexmark/ast/Text;)V
    .locals 1

    .line 27
    iget-object v0, p0, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;->this$0:Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;

    invoke-static {v0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;->access$000(Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor;Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method

.method public bridge synthetic visit(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 24
    check-cast p1, Lcom/vladsch/flexmark/ast/Text;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ast/util/LineCollectingVisitor$1;->visit(Lcom/vladsch/flexmark/ast/Text;)V

    return-void
.end method
