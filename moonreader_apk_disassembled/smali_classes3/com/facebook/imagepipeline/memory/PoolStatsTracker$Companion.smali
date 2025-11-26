.class public final Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;
.super Ljava/lang/Object;
.source "PoolStatsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/imagepipeline/memory/PoolStatsTracker;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000c"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;",
        "",
        "<init>",
        "()V",
        "BUCKETS_USED_PREFIX",
        "",
        "USED_COUNT",
        "USED_BYTES",
        "FREE_COUNT",
        "FREE_BYTES",
        "SOFT_CAP",
        "HARD_CAP",
        "imagepipeline_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field static final synthetic $$INSTANCE:Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

.field public static final BUCKETS_USED_PREFIX:Ljava/lang/String; = "buckets_used_"

.field public static final FREE_BYTES:Ljava/lang/String; = "free_bytes"

.field public static final FREE_COUNT:Ljava/lang/String; = "free_count"

.field public static final HARD_CAP:Ljava/lang/String; = "hard_cap"

.field public static final SOFT_CAP:Ljava/lang/String; = "soft_cap"

.field public static final USED_BYTES:Ljava/lang/String; = "used_bytes"

.field public static final USED_COUNT:Ljava/lang/String; = "used_count"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

    invoke-direct {v0}, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;-><init>()V

    sput-object v0, Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;->$$INSTANCE:Lcom/facebook/imagepipeline/memory/PoolStatsTracker$Companion;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
