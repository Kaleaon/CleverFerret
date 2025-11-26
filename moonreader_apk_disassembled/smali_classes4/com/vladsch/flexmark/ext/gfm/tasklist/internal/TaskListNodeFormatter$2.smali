.class Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;
.super Ljava/lang/Object;
.source "TaskListNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/CustomNodeFormatter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->getNodeFormattingHandlers()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/formatter/CustomNodeFormatter<",
        "Lcom/vladsch/flexmark/ast/BulletList;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 1

    .line 43
    iget-object v0, p0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;->this$0:Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;

    invoke-static {v0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;->access$100(Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method

.method public bridge synthetic render(Lcom/vladsch/flexmark/util/ast/Node;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V
    .locals 0

    .line 40
    check-cast p1, Lcom/vladsch/flexmark/ast/BulletList;

    invoke-virtual {p0, p1, p2, p3}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$2;->render(Lcom/vladsch/flexmark/ast/BulletList;Lcom/vladsch/flexmark/formatter/NodeFormatterContext;Lcom/vladsch/flexmark/formatter/MarkdownWriter;)V

    return-void
.end method
