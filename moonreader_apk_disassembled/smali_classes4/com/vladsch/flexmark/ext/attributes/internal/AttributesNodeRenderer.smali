.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;
.super Ljava/lang/Object;
.source "AttributesNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRenderer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$Factory;
    }
.end annotation


# instance fields
.field private final myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    iput-object v0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    return-void
.end method

.method static synthetic access$000(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;
    .locals 0

    .line 14
    iget-object p0, p0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;->myOptions:Lcom/vladsch/flexmark/ext/attributes/internal/AttributesOptions;

    return-object p0
.end method


# virtual methods
.method public getNodeRenderingHandlers()Ljava/util/Set;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler<",
            "*>;>;"
        }
    .end annotation

    .line 25
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 26
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$1;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$1;-><init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 32
    new-instance v1, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;

    const-class v2, Lcom/vladsch/flexmark/ast/TextBase;

    new-instance v3, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;

    invoke-direct {v3, p0}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer$2;-><init>(Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodeRenderer;)V

    invoke-direct {v1, v2, v3}, Lcom/vladsch/flexmark/html/renderer/NodeRenderingHandler;-><init>(Ljava/lang/Class;Lcom/vladsch/flexmark/html/CustomNodeRenderer;)V

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-object v0
.end method
