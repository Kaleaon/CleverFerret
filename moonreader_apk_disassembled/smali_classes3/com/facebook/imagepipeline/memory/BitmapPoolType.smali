.class public interface abstract annotation Lcom/facebook/imagepipeline/memory/BitmapPoolType;
.super Ljava/lang/Object;
.source "BitmapPoolType.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/memory/BitmapPoolType$Companion;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0002\u0008\u0002\u0008\u0086\u0002\u0018\u0000 \u00022\u00020\u0001:\u0001\u0002B\u0000\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/memory/BitmapPoolType;",
        "",
        "Companion",
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
.field public static final Companion:Lcom/facebook/imagepipeline/memory/BitmapPoolType$Companion;

.field public static final DEFAULT:Ljava/lang/String; = "legacy"

.field public static final DUMMY:Ljava/lang/String; = "dummy"

.field public static final DUMMY_WITH_TRACKING:Ljava/lang/String; = "dummy_with_tracking"

.field public static final EXPERIMENTAL:Ljava/lang/String; = "experimental"

.field public static final LEGACY:Ljava/lang/String; = "legacy"

.field public static final LEGACY_DEFAULT_PARAMS:Ljava/lang/String; = "legacy_default_params"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/facebook/imagepipeline/memory/BitmapPoolType$Companion;->$$INSTANCE:Lcom/facebook/imagepipeline/memory/BitmapPoolType$Companion;

    sput-object v0, Lcom/facebook/imagepipeline/memory/BitmapPoolType;->Companion:Lcom/facebook/imagepipeline/memory/BitmapPoolType$Companion;

    return-void
.end method
