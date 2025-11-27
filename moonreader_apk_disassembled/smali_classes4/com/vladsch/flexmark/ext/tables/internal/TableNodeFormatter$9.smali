.class Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;
.super Ljava/lang/Object;
.source "TableNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;->render(Lcom/vladsch/flexmark/ext/tables/TableCell;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;

.field final synthetic val$childText:[Ljava/lang/String;

.field final synthetic val$node:Lcom/vladsch/flexmark/ext/tables/TableCell;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;Lcom/vladsch/flexmark/ext/tables/TableCell;[Ljava/lang/String;)V
    .locals 0

    .line 208
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;->this$0:Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter;

    iput-object p2, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;->val$node:Lcom/vladsch/flexmark/ext/tables/TableCell;

    iput-object p3, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;->val$childText:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 211
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;->val$node:Lcom/vladsch/flexmark/ext/tables/TableCell;

    invoke-interface {p1, v0}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    .line 212
    iget-object p1, p0, Lcom/vladsch/flexmark/ext/tables/internal/TableNodeFormatter$9;->val$childText:[Ljava/lang/String;

    const/4 v0, 0x0

    invoke-virtual {p2}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->getText()Ljava/lang/String;

    move-result-object p2

    aput-object p2, p1, v0

    return-void
.end method
