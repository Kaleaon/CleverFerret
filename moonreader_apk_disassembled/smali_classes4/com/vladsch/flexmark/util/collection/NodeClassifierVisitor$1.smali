.class Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor$1;
.super Ljava/lang/Object;
.source "NodeClassifierVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Computable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Computable<",
        "Ljava/util/BitSet;",
        "Ljava/util/BitSet;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;)V
    .locals 0

    .line 16
    iput-object p1, p0, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor$1;->this$0:Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compute(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 16
    check-cast p1, Ljava/util/BitSet;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeClassifierVisitor$1;->compute(Ljava/util/BitSet;)Ljava/util/BitSet;

    move-result-object p1

    return-object p1
.end method

.method public compute(Ljava/util/BitSet;)Ljava/util/BitSet;
    .locals 0

    if-eqz p1, :cond_0

    .line 18
    invoke-virtual {p1}, Ljava/util/BitSet;->clone()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/BitSet;

    return-object p1

    :cond_0
    new-instance p1, Ljava/util/BitSet;

    invoke-direct {p1}, Ljava/util/BitSet;-><init>()V

    return-object p1
.end method
