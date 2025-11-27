.class public Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;
.super Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;
.source "AttributesNodePostProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 3

    const/4 v0, 0x0

    .line 289
    invoke-direct {p0, v0}, Lcom/vladsch/flexmark/parser/block/NodePostProcessorFactory;-><init>(Z)V

    const/4 v1, 0x1

    .line 290
    new-array v1, v1, [Ljava/lang/Class;

    const-class v2, Lcom/vladsch/flexmark/ext/attributes/AttributesNode;

    aput-object v2, v1, v0

    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;->addNodes([Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/PostProcessor;
    .locals 0

    .line 287
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method

.method public create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;
    .locals 1

    .line 295
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor;-><init>(Lcom/vladsch/flexmark/util/ast/Document;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 287
    check-cast p1, Lcom/vladsch/flexmark/util/ast/Document;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/AttributesNodePostProcessor$Factory;->create(Lcom/vladsch/flexmark/util/ast/Document;)Lcom/vladsch/flexmark/parser/block/NodePostProcessor;

    move-result-object p1

    return-object p1
.end method
