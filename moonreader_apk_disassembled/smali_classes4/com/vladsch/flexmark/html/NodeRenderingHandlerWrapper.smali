.class Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;
.super Ljava/lang/Object;
.source "NodeRenderingHandlerWrapper.java"


# instance fields
.field public final myPreviousRenderingHandler:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

.field public final myRenderingHandler:Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myRenderingHandler:Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    .line 11
    iput-object p2, p0, Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;->myPreviousRenderingHandler:Lcom/vladsch/flexmark/html/NodeRenderingHandlerWrapper;

    return-void
.end method
