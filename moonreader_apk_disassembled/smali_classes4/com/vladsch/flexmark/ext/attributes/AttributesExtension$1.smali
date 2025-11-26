.class final Lcom/vladsch/flexmark/ext/attributes/AttributesExtension$1;
.super Ljava/lang/Object;
.source "AttributesExtension.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/DataValueFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/attributes/AttributesExtension;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
        "Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;
    .locals 1

    .line 31
    new-instance v0, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method

.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 29
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/ext/attributes/AttributesExtension$1;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/ext/attributes/internal/NodeAttributeRepository;

    move-result-object p1

    return-object p1
.end method
