.class final Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;
.super Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;
.source "EmbeddedAttributeProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;
    .locals 1

    .line 18
    new-instance p1, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider;-><init>(Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;)V

    return-object p1
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 14
    check-cast p1, Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/EmbeddedAttributeProvider$1;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;

    move-result-object p1

    return-object p1
.end method
