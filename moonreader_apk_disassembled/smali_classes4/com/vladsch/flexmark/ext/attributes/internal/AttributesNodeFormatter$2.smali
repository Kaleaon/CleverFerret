.class Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;
.super Ljava/lang/Object;
.source "AttributesNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->getNodeFormattingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;)V
    .locals 0

    .line 70
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;->this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;->this$0:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter;->render(Lcom/vladsch/flexmark/ext/attributes/AttributesNode;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 70
    check-cast p1, Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeFormatter$2;->render(Lcom/vladsch/flexmark/ext/attributes/AttributesDelimiter;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
