.class public Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;
.super Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;
.source "PostProcessorManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/parser/internal/PostProcessorManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PostProcessorDependencies"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies<",
        "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;",
        ">;"
    }
.end annotation


# instance fields
.field private final myWithExclusions:Z


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;",
            ">;)V"
        }
    .end annotation

    .line 176
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/dependency/ResolvedDependencies;-><init>(Ljava/util/List;)V

    .line 178
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;

    .line 179
    invoke-static {v0}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;->access$300(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencyStage;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    .line 184
    :goto_0
    iput-boolean p1, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;->myWithExclusions:Z

    return-void
.end method


# virtual methods
.method public isWithExclusions()Z
    .locals 1

    .line 188
    iget-boolean v0, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessorDependencies;->myWithExclusions:Z

    return v0
.end method
