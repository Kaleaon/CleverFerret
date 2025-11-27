.class final Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor$1;
.super Ljava/lang/Object;
.source "NodeCollectingVisitor.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/Computable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/Computable<",
        "Ljava/lang/Class;",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compute(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/Class;
    .locals 0

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compute(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 9
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Node;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/collection/NodeCollectingVisitor$1;->compute(Lcom/vladsch/flexmark/util/ast/Node;)Ljava/lang/Class;

    move-result-object p1

    return-object p1
.end method
