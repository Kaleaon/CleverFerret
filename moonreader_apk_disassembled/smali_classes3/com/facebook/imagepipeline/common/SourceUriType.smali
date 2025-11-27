.class public interface abstract annotation Lcom/facebook/imagepipeline/common/SourceUriType;
.super Ljava/lang/Object;
.source "SourceUriType.kt"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/common/SourceUriType$Companion;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->SOURCE:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0002\u0008\u0002\u0008\u0087\u0002\u0018\u0000 \u00022\u00020\u0001:\u0001\u0002B\u0000\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/common/SourceUriType;",
        "",
        "Companion",
        "imagepipeline-base_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/annotation/Retention;
    value = .enum Lkotlin/annotation/AnnotationRetention;->SOURCE:Lkotlin/annotation/AnnotationRetention;
.end annotation


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/common/SourceUriType$Companion;

.field public static final SOURCE_TYPE_DATA:I = 0x7

.field public static final SOURCE_TYPE_LOCAL_ASSET:I = 0x5

.field public static final SOURCE_TYPE_LOCAL_CONTENT:I = 0x4

.field public static final SOURCE_TYPE_LOCAL_FILE:I = 0x1

.field public static final SOURCE_TYPE_LOCAL_IMAGE_FILE:I = 0x3

.field public static final SOURCE_TYPE_LOCAL_RESOURCE:I = 0x6

.field public static final SOURCE_TYPE_LOCAL_VIDEO_FILE:I = 0x2

.field public static final SOURCE_TYPE_NETWORK:I = 0x0

.field public static final SOURCE_TYPE_QUALIFIED_RESOURCE:I = 0x8

.field public static final SOURCE_TYPE_UNKNOWN:I = -0x1


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/facebook/imagepipeline/common/SourceUriType$Companion;->$$INSTANCE:Lcom/facebook/imagepipeline/common/SourceUriType$Companion;

    sput-object v0, Lcom/facebook/imagepipeline/common/SourceUriType;->Companion:Lcom/facebook/imagepipeline/common/SourceUriType$Companion;

    return-void
.end method
