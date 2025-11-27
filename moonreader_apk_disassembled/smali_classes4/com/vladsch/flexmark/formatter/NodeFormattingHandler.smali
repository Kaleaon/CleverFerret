.class public Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;
.super Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;
.source "NodeFormattingHandler.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">",
        "Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler<",
        "TN;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "TN;>;>;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "Lcom/vladsch/flexmark/util/ast/Node;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/Class;Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+TN;>;",
            "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
            "TN;>;)V"
        }
    .end annotation

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;)V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/NodeFormattingHandler;->myAdapter:Lcom/vladsch/flexmark/util/ast/NodeAdaptingVisitor;

    check-cast v0, Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;

    invoke-interface {v0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;->render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
