.class Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;
.super Ljava/lang/Object;
.source "CoreNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/TranslatingSpanRender;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;->render(Lcom/vladsch/flexmark/ast/HtmlEntity;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

.field final synthetic val$node:Lcom/vladsch/flexmark/ast/HtmlEntity;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;Lcom/vladsch/flexmark/ast/HtmlEntity;)V
    .locals 0

    .line 938
    iput-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;->this$0:Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter;

    iput-object p2, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;->val$node:Lcom/vladsch/flexmark/ast/HtmlEntity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 941
    iget-object p1, p0, Lcom/vladsch/flexmark/formatter/internal/CoreNodeFormatter$40;->val$node:Lcom/vladsch/flexmark/ast/HtmlEntity;

    invoke-virtual {p1}, Lcom/vladsch/flexmark/ast/HtmlEntity;->getChars()Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/vladsch/flexmark/formatter/MarkdownWriter;->appendNonTranslating(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/formatter/MarkdownWriter;

    return-void
.end method
