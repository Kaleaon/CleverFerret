.class public final Lcom/facebook/fresco/vito/source/ImageSourceExtras;
.super Ljava/lang/Object;
.source "ImageSourceExtras.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/facebook/fresco/vito/source/ImageSourceExtras;",
        "",
        "<init>",
        "()V",
        "IMAGE_FORMAT",
        "",
        "source_release"
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
.field public static final IMAGE_FORMAT:Ljava/lang/String; = "image_format"

.field public static final INSTANCE:Lcom/facebook/fresco/vito/source/ImageSourceExtras;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/fresco/vito/source/ImageSourceExtras;

    invoke-direct {v0}, Lcom/facebook/fresco/vito/source/ImageSourceExtras;-><init>()V

    sput-object v0, Lcom/facebook/fresco/vito/source/ImageSourceExtras;->INSTANCE:Lcom/facebook/fresco/vito/source/ImageSourceExtras;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
