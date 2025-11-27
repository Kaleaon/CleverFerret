.class public final Lcom/facebook/imagepipeline/common/RotationOptions;
.super Ljava/lang/Object;
.source "RotationOptions.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imagepipeline/common/RotationOptions$Companion;,
        Lcom/facebook/imagepipeline/common/RotationOptions$Rotation;,
        Lcom/facebook/imagepipeline/common/RotationOptions$RotationAngle;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nRotationOptions.kt\nKotlin\n*S Kotlin\n*F\n+ 1 RotationOptions.kt\ncom/facebook/imagepipeline/common/RotationOptions\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,133:1\n1#2:134\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u000c\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0018\u0000 \u00152\u00020\u0001:\u0003\u0013\u0014\u0015B\u0019\u0008\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0006\u0010\u0008\u001a\u00020\u0005J\u0006\u0010\t\u001a\u00020\u0005J\u0006\u0010\r\u001a\u00020\u0005J\u0008\u0010\u000e\u001a\u00020\u0003H\u0016J\u0013\u0010\u000f\u001a\u00020\u00052\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0001H\u0096\u0002J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0011\u0010\n\u001a\u00020\u00038F\u00a2\u0006\u0006\u001a\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/common/RotationOptions;",
        "",
        "rotation",
        "",
        "deferUntilRendered",
        "",
        "<init>",
        "(IZ)V",
        "useImageMetadata",
        "rotationEnabled",
        "forcedAngle",
        "getForcedAngle",
        "()I",
        "canDeferUntilRendered",
        "hashCode",
        "equals",
        "other",
        "toString",
        "",
        "Rotation",
        "RotationAngle",
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


# static fields
.field public static final Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

.field private static final DISABLE_ROTATION:I = -0x2

.field public static final NO_ROTATION:I = 0x0

.field public static final ROTATE_180:I = 0xb4

.field public static final ROTATE_270:I = 0x10e

.field public static final ROTATE_90:I = 0x5a

.field private static final ROTATION_OPTIONS_AUTO_ROTATE:Lcom/facebook/imagepipeline/common/RotationOptions;

.field private static final ROTATION_OPTIONS_DISABLE_ROTATION:Lcom/facebook/imagepipeline/common/RotationOptions;

.field private static final ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME:Lcom/facebook/imagepipeline/common/RotationOptions;

.field private static final USE_EXIF_ROTATION_ANGLE:I = -0x1


# instance fields
.field private final deferUntilRendered:Z

.field private final rotation:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    .line 94
    new-instance v0, Lcom/facebook/imagepipeline/common/RotationOptions;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/facebook/imagepipeline/common/RotationOptions;-><init>(IZ)V

    sput-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_AUTO_ROTATE:Lcom/facebook/imagepipeline/common/RotationOptions;

    .line 95
    new-instance v0, Lcom/facebook/imagepipeline/common/RotationOptions;

    const/4 v3, -0x2

    invoke-direct {v0, v3, v2}, Lcom/facebook/imagepipeline/common/RotationOptions;-><init>(IZ)V

    sput-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_DISABLE_ROTATION:Lcom/facebook/imagepipeline/common/RotationOptions;

    .line 97
    new-instance v0, Lcom/facebook/imagepipeline/common/RotationOptions;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/facebook/imagepipeline/common/RotationOptions;-><init>(IZ)V

    sput-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-void
.end method

.method private constructor <init>(IZ)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    .line 32
    iput-boolean p2, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    return-void
.end method

.method public synthetic constructor <init>(IZLkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/facebook/imagepipeline/common/RotationOptions;-><init>(IZ)V

    return-void
.end method

.method public static final synthetic access$getROTATION_OPTIONS_AUTO_ROTATE$cp()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1

    .line 29
    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_AUTO_ROTATE:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-object v0
.end method

.method public static final synthetic access$getROTATION_OPTIONS_DISABLE_ROTATION$cp()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1

    .line 29
    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_DISABLE_ROTATION:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-object v0
.end method

.method public static final synthetic access$getROTATION_OPTIONS_ROTATE_AT_RENDER_TIME$cp()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1

    .line 29
    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->ROTATION_OPTIONS_ROTATE_AT_RENDER_TIME:Lcom/facebook/imagepipeline/common/RotationOptions;

    return-object v0
.end method

.method public static final autoRotate()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;->autoRotate()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public static final autoRotateAtRenderTime()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;->autoRotateAtRenderTime()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public static final disableRotation()Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    invoke-virtual {v0}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;->disableRotation()Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object v0

    return-object v0
.end method

.method public static final forceRotation(I)Lcom/facebook/imagepipeline/common/RotationOptions;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imagepipeline/common/RotationOptions;->Companion:Lcom/facebook/imagepipeline/common/RotationOptions$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imagepipeline/common/RotationOptions$Companion;->forceRotation(I)Lcom/facebook/imagepipeline/common/RotationOptions;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final canDeferUntilRendered()Z
    .locals 1

    .line 69
    iget-boolean v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 77
    :cond_0
    instance-of v1, p1, Lcom/facebook/imagepipeline/common/RotationOptions;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 81
    :cond_1
    iget v1, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    check-cast p1, Lcom/facebook/imagepipeline/common/RotationOptions;

    iget v3, p1, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    iget-boolean p1, p1, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    if-ne v1, p1, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public final getForcedAngle()I
    .locals 2

    .line 65
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/common/RotationOptions;->useImageMetadata()Z

    move-result v0

    if-nez v0, :cond_0

    .line 66
    iget v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    return v0

    .line 65
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Rotation is set to use EXIF"

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public hashCode()I
    .locals 2

    .line 71
    iget v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/facebook/common/util/HashCodeUtil;->hashCode(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public final rotationEnabled()Z
    .locals 2

    .line 54
    iget v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    const/4 v1, -0x2

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 85
    sget-object v0, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    iget v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iget-boolean v1, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->deferUntilRendered:Z

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    invoke-static {v3, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "%d defer:%b"

    invoke-static {v1, v2, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "format(...)"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v0
.end method

.method public final useImageMetadata()Z
    .locals 2

    .line 52
    iget v0, p0, Lcom/facebook/imagepipeline/common/RotationOptions;->rotation:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method
