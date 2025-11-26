.class public final synthetic Lcom/facebook/imagepipeline/core/PriorityThreadFactory$$ExternalSyntheticLambda0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

.field public final synthetic f$1:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Lcom/facebook/imagepipeline/core/PriorityThreadFactory;Ljava/lang/Runnable;)V
    .locals 0

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    iput-object p2, p0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 0
    iget-object v0, p0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory$$ExternalSyntheticLambda0;->f$0:Lcom/facebook/imagepipeline/core/PriorityThreadFactory;

    iget-object v1, p0, Lcom/facebook/imagepipeline/core/PriorityThreadFactory$$ExternalSyntheticLambda0;->f$1:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lcom/facebook/imagepipeline/core/PriorityThreadFactory;->$r8$lambda$gKxQU1bghuEskyM4mT5eRzkaG54(Lcom/facebook/imagepipeline/core/PriorityThreadFactory;Ljava/lang/Runnable;)V

    return-void
.end method
