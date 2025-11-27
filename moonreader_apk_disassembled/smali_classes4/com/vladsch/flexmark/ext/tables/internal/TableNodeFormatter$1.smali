.class Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;
.super Ljava/lang/Object;
.source "TableNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->getNodeFormattingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "Lcom/vladsch/flexmark/ext/tables/TableBlock;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 48
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->access$000(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 45
    check-cast p1, Lcom/vladsch/flexmark/ext/tables/TableBlock;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$1;->render(Lcom/vladsch/flexmark/ext/tables/TableBlock;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
