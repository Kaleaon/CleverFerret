.class final Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$38;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->renderTextBlockParagraphLines(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$node:Lcom/vladsch/flexmark/util/ast/Node;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/util/ast/Node;)V
    .locals 0

    .line 825
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$38;->val$node:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 828
    iget-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$38;->val$node:Lcom/vladsch/flexmark/util/ast/Node;

    invoke-interface {p1, p2}, Lcom/vladsch/flexmark/formatter/NodeFormatterContext;->renderChildren(Lcom/vladsch/flexmark/util/ast/Node;)V

    return-void
.end method
