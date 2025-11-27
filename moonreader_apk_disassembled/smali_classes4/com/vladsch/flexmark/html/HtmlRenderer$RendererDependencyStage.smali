.class public Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;
.super Ljava/lang/Object;
.source "HtmlRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/html/HtmlRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RendererDependencyStage"
.end annotation


# instance fields
.field private final dependents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/html/DelegatingNodeRendererFactoryWrapper;",
            ">;)V"
        }
    .end annotation

    .line 501
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 502
    iput-object p1, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;->dependents:Ljava/util/List;

    return-void
.end method

.method static synthetic access$100(Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;)Ljava/util/List;
    .locals 0

    .line 498
    iget-object p0, p0, Lcom/vladsch/flexmark/html/HtmlRenderer$RendererDependencyStage;->dependents:Ljava/util/List;

    return-object p0
.end method
