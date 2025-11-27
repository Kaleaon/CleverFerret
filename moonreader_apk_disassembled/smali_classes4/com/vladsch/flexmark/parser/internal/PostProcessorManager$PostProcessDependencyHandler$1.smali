.class Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler$1;
.super Ljava/lang/Object;
.source "PostProcessorManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;->prioritize(Lcom/vladsch/flexmark/util/dependency/DependentItemMap;)Lcom/vladsch/flexmark/util/dependency/DependentItemMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/Class;",
        "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
        "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;


# direct methods
.method constructor <init>(Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;)V
    .locals 0

    .line 212
    iput-object p1, p0, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler$1;->this$0:Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 212
    check-cast p1, Ljava/util/Map$Entry;

    check-cast p2, Ljava/util/Map$Entry;

    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/parser/internal/PostProcessorManager$PostProcessDependencyHandler$1;->compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I

    move-result p1

    return p1
.end method

.method public compare(Ljava/util/Map$Entry;Ljava/util/Map$Entry;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Class;",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;>;",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/Class;",
            "Lcom/vladsch/flexmark/util/dependency/DependentItem<",
            "Lcom/vladsch/flexmark/parser/PostProcessorFactory;",
            ">;>;)I"
        }
    .end annotation

    .line 215
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    iget-boolean p1, p1, Lcom/vladsch/flexmark/util/dependency/DependentItem;->isGlobalScope:Z

    .line 216
    invoke-interface {p2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/vladsch/flexmark/util/dependency/DependentItem;

    iget-boolean p2, p2, Lcom/vladsch/flexmark/util/dependency/DependentItem;->isGlobalScope:Z

    sub-int/2addr p1, p2

    return p1
.end method
