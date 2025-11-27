.class Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;
.super Ljava/lang/Object;
.source "CoreNodeRenderer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;->render(Lcom/vladsch/flexmark/ast/AutoLink;Lcom/vladsch/flexmark/html/renderer/NodeRendererContext;Lcom/vladsch/flexmark/html/HtmlWriter;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

.field final synthetic val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

.field final synthetic val$text:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;Lcom/vladsch/flexmark/html/HtmlWriter;Ljava/lang/String;)V
    .locals 0

    .line 786
    iput-object p1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;->this$0:Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer;

    iput-object p2, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iput-object p3, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;->val$text:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 789
    iget-object v0, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;->val$html:Lcom/vladsch/flexmark/html/HtmlWriter;

    iget-object v1, p0, Lcom/vladsch/flexmark/html/renderer/CoreNodeRenderer$43;->val$text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vladsch/flexmark/html/HtmlWriter;->text(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/html/HtmlFormattingAppendableBase;

    return-void
.end method
