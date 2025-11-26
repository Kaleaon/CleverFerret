.class public Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer$Factory;
.super Ljava/lang/Object;
.source "FootnoteNodeRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/html/renderer/NodeRendererFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/html/renderer/NodeRenderer;
    .locals 1

    .line 155
    new-instance v0, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/footnotes/internal/FootnoteNodeRenderer;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method
