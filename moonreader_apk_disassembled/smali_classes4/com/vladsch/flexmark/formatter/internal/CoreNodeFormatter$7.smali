.class Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->getNodeFormattingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "Lcom/vladsch/flexmark/util/ast/Document;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;)V
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 194
    iget-object v0, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->access$500(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 191
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$7;->render(Lcom/vladsch/flexmark/util/ast/Document;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
