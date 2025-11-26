.class final Lcom/vladsch/flexmark/html/HtmlRenderer$1;
.super Ljava/lang/Object;
.source "HtmlRenderer.java"

# interfaces
.implements Lcom/vladsch/flexmark/util/collection/DataValueFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vladsch/flexmark/util/collection/DataValueFactory<",
        "Ljava/util/ArrayList<",
        "Lcom/vladsch/flexmark/util/sequence/TagRange;",
        ">;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic create(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 73
    check-cast p1, Lcom/vladsch/flexmark/util/options/DataHolder;

    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/html/HtmlRenderer$1;->create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1
.end method

.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vladsch/flexmark/util/options/DataHolder;",
            ")",
            "Ljava/util/ArrayList<",
            "Lcom/vladsch/flexmark/util/sequence/TagRange;",
            ">;"
        }
    .end annotation

    .line 76
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1
.end method
