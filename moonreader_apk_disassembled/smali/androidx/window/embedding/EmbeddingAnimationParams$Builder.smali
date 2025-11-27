.class public final Landroidx/window/embedding/EmbeddingAnimationParams$Builder;
.super Ljava/lang/Object;
.source "EmbeddingAnimationParams.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/window/embedding/EmbeddingAnimationParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0005\u00a2\u0006\u0002\u0010\u0002J\u0006\u0010\u0005\u001a\u00020\u0006J\u0010\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0008\u001a\u00020\u0004H\u0007R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\t"
    }
    d2 = {
        "Landroidx/window/embedding/EmbeddingAnimationParams$Builder;",
        "",
        "()V",
        "animationBackground",
        "Landroidx/window/embedding/EmbeddingAnimationBackground;",
        "build",
        "Landroidx/window/embedding/EmbeddingAnimationParams;",
        "setAnimationBackground",
        "background",
        "window_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x9,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private animationBackground:Landroidx/window/embedding/EmbeddingAnimationBackground;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 70
    sget-object v0, Landroidx/window/embedding/EmbeddingAnimationBackground;->DEFAULT:Landroidx/window/embedding/EmbeddingAnimationBackground;

    iput-object v0, p0, Landroidx/window/embedding/EmbeddingAnimationParams$Builder;->animationBackground:Landroidx/window/embedding/EmbeddingAnimationBackground;

    return-void
.end method


# virtual methods
.method public final build()Landroidx/window/embedding/EmbeddingAnimationParams;
    .locals 3

    .line 95
    new-instance v0, Landroidx/window/embedding/EmbeddingAnimationParams;

    iget-object v1, p0, Landroidx/window/embedding/EmbeddingAnimationParams$Builder;->animationBackground:Landroidx/window/embedding/EmbeddingAnimationBackground;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroidx/window/embedding/EmbeddingAnimationParams;-><init>(Landroidx/window/embedding/EmbeddingAnimationBackground;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public final setAnimationBackground(Landroidx/window/embedding/EmbeddingAnimationBackground;)Landroidx/window/embedding/EmbeddingAnimationParams$Builder;
    .locals 1

    const-string v0, "background"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 85
    move-object v0, p0

    check-cast v0, Landroidx/window/embedding/EmbeddingAnimationParams$Builder;

    .line 86
    iput-object p1, p0, Landroidx/window/embedding/EmbeddingAnimationParams$Builder;->animationBackground:Landroidx/window/embedding/EmbeddingAnimationBackground;

    return-object p0
.end method
