.class Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/Heading;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/Heading;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/Heading;)V
    .locals 0

    .line 463
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;->val$node:Lcom/vladsch/flexmark/ast/Heading;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 466
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$37;->val$node:Lcom/vladsch/flexmark/ast/Heading;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
