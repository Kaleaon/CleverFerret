.class public Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer$Factory;
.super Ljava/lang/Object;
.source "StrikethroughNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 82
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;
    .locals 1

    .line 85
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/gfm/strikethrough/internal/StrikethroughNodeRenderer;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method
