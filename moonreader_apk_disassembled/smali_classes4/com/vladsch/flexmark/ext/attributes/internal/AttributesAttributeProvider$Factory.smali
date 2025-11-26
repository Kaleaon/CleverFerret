.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;
.super Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;
.source "AttributesAttributeProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/vladsch/flexmark/html/IndependentAttributeProviderFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;
    .locals 1

    .line 88
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider;-><init>(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 70
    check-cast p1, Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesAttributeProvider$Factory;->create(Lcom/vladsch/flexmark/html/renderer/LinkResolverContext;)Lcom/vladsch/flexmark/html/AttributeProvider;

    move-result-object p1

    return-object p1
.end method
