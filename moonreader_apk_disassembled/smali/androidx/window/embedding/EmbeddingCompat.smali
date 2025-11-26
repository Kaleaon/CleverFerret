.class public final Landroidx/window/embedding/EmbeddingCompat;
.super Ljava/lang/Object;
.source "EmbeddingCompat.kt"

# interfaces
.implements Landroidx/window/embedding/EmbeddingInterfaceCompat;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/window/embedding/EmbeddingCompat$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nEmbeddingCompat.kt\nKotlin\n*S Kotlin\n*F\n+ 1 EmbeddingCompat.kt\nandroidx/window/embedding/EmbeddingCompat\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,375:1\n1620#2,3:376\n*S KotlinDebug\n*F\n+ 1 EmbeddingCompat.kt\nandroidx/window/embedding/EmbeddingCompat\n*L\n166#1:376,3\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u00cc\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\"\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u0000 S2\u00020\u0001:\u0001SB9\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0008\u0010\n\u001a\u0004\u0018\u00010\u000b\u0012\u0008\u0010\u000c\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0002\u0010\u000eJ\u001e\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001aH\u0017J&\u0010\u001c\u001a\u00020\u00162\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020 2\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001aH\u0017J\u0008\u0010#\u001a\u00020\u0016H\u0017J\u0008\u0010$\u001a\u00020\u0016H\u0017J\u0016\u0010%\u001a\u00020\u00162\u000c\u0010&\u001a\u0008\u0012\u0004\u0012\u00020(0\'H\u0017J\u0008\u0010)\u001a\u00020\u0016H\u0017J\u0010\u0010*\u001a\u00020\u00102\u0006\u0010\u0017\u001a\u00020\u0018H\u0016J\u0018\u0010+\u001a\u00020\u00102\u0006\u0010,\u001a\u00020-2\u0006\u0010.\u001a\u00020/H\u0017J\u0010\u00100\u001a\u00020\u00162\u0006\u00101\u001a\u000202H\u0002J\u0016\u00103\u001a\u00020\u00162\u000c\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001aH\u0017J\u0016\u00104\u001a\u00020\u00162\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\"0\u001aH\u0017J\u0008\u00105\u001a\u00020\u0016H\u0002J\u0010\u00106\u001a\u00020\u00162\u0006\u00101\u001a\u000202H\u0016J\u0010\u00107\u001a\u00020\u00162\u0006\u00108\u001a\u000209H\u0017J\u0018\u0010:\u001a\u00020;2\u0006\u0010<\u001a\u00020;2\u0006\u0010=\u001a\u00020(H\u0017J\u001c\u0010>\u001a\u00020\u00162\u0012\u0010?\u001a\u000e\u0012\u0004\u0012\u00020A\u0012\u0004\u0012\u00020B0@H\u0017J\u0018\u0010C\u001a\u00020;2\u0006\u0010<\u001a\u00020;2\u0006\u0010D\u001a\u00020EH\u0017J\u0016\u0010F\u001a\u00020\u00162\u000c\u0010G\u001a\u0008\u0012\u0004\u0012\u00020H0\'H\u0016J\u001c\u0010I\u001a\u00020\u00162\u0012\u0010?\u001a\u000e\u0012\u0004\u0012\u00020J\u0012\u0004\u0012\u00020K0@H\u0017J\u0010\u0010L\u001a\u00020\u00162\u0006\u0010,\u001a\u00020-H\u0017J\u0018\u0010M\u001a\u00020\u00162\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010N\u001a\u00020BH\u0017J\u0018\u0010O\u001a\u00020\u00162\u0006\u0010P\u001a\u00020Q2\u0006\u0010R\u001a\u00020KH\u0017J\u000c\u0010)\u001a\u00020\u0016*\u00020\u0003H\u0002R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0018\u0010\n\u001a\u0004\u0018\u00010\u000b8\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012R\u000e\u0010\u0013\u001a\u00020\u0014X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006T"
    }
    d2 = {
        "Landroidx/window/embedding/EmbeddingCompat;",
        "Landroidx/window/embedding/EmbeddingInterfaceCompat;",
        "embeddingExtension",
        "Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;",
        "adapter",
        "Landroidx/window/embedding/EmbeddingAdapter;",
        "consumerAdapter",
        "Landroidx/window/core/ConsumerAdapter;",
        "applicationContext",
        "Landroid/content/Context;",
        "overlayController",
        "Landroidx/window/embedding/OverlayControllerImpl;",
        "activityWindowInfoCallbackController",
        "Landroidx/window/embedding/ActivityWindowInfoCallbackController;",
        "(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Landroidx/window/embedding/EmbeddingAdapter;Landroidx/window/core/ConsumerAdapter;Landroid/content/Context;Landroidx/window/embedding/OverlayControllerImpl;Landroidx/window/embedding/ActivityWindowInfoCallbackController;)V",
        "isCustomSplitAttributeCalculatorSet",
        "",
        "getOverlayController$window_release",
        "()Landroidx/window/embedding/OverlayControllerImpl;",
        "windowSdkExtensions",
        "Landroidx/window/WindowSdkExtensions;",
        "addEmbeddedActivityWindowInfoCallbackForActivity",
        "",
        "activity",
        "Landroid/app/Activity;",
        "callback",
        "Landroidx/core/util/Consumer;",
        "Landroidx/window/embedding/EmbeddedActivityWindowInfo;",
        "addOverlayInfoCallback",
        "overlayTag",
        "",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "overlayInfoCallback",
        "Landroidx/window/embedding/OverlayInfo;",
        "clearOverlayAttributesCalculator",
        "clearSplitAttributesCalculator",
        "finishActivityStacks",
        "activityStacks",
        "",
        "Landroidx/window/embedding/ActivityStack;",
        "invalidateVisibleActivityStacks",
        "isActivityEmbedded",
        "pinTopActivityStack",
        "taskId",
        "",
        "splitPinRule",
        "Landroidx/window/embedding/SplitPinRule;",
        "registerSplitInfoCallback",
        "embeddingCallback",
        "Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;",
        "removeEmbeddedActivityWindowInfoCallbackForActivity",
        "removeOverlayInfoCallback",
        "setDefaultSplitAttributeCalculatorIfNeeded",
        "setEmbeddingCallback",
        "setEmbeddingConfiguration",
        "embeddingConfig",
        "Landroidx/window/embedding/EmbeddingConfiguration;",
        "setLaunchingActivityStack",
        "Landroid/os/Bundle;",
        "options",
        "activityStack",
        "setOverlayAttributesCalculator",
        "calculator",
        "Lkotlin/Function1;",
        "Landroidx/window/embedding/OverlayAttributesCalculatorParams;",
        "Landroidx/window/embedding/OverlayAttributes;",
        "setOverlayCreateParams",
        "overlayCreateParams",
        "Landroidx/window/embedding/OverlayCreateParams;",
        "setRules",
        "rules",
        "Landroidx/window/embedding/EmbeddingRule;",
        "setSplitAttributesCalculator",
        "Landroidx/window/embedding/SplitAttributesCalculatorParams;",
        "Landroidx/window/embedding/SplitAttributes;",
        "unpinTopActivityStack",
        "updateOverlayAttributes",
        "overlayAttributes",
        "updateSplitAttributes",
        "splitInfo",
        "Landroidx/window/embedding/SplitInfo;",
        "splitAttributes",
        "Companion",
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


# static fields
.field public static final Companion:Landroidx/window/embedding/EmbeddingCompat$Companion;

.field public static final DEBUG:Z = true

.field private static final TAG:Ljava/lang/String; = "EmbeddingCompat"


# instance fields
.field private final activityWindowInfoCallbackController:Landroidx/window/embedding/ActivityWindowInfoCallbackController;

.field private final adapter:Landroidx/window/embedding/EmbeddingAdapter;

.field private final applicationContext:Landroid/content/Context;

.field private final consumerAdapter:Landroidx/window/core/ConsumerAdapter;

.field private final embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

.field private isCustomSplitAttributeCalculatorSet:Z

.field private final overlayController:Landroidx/window/embedding/OverlayControllerImpl;

.field private final windowSdkExtensions:Landroidx/window/WindowSdkExtensions;


# direct methods
.method public static synthetic $r8$lambda$FhZ26UpQRGrpYS0qhc0lH0xKupw(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingCompat;Ljava/util/List;)V
    .locals 0

    invoke-static {p0, p1, p2}, Landroidx/window/embedding/EmbeddingCompat;->registerSplitInfoCallback$lambda$0(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingCompat;Ljava/util/List;)V

    return-void
.end method

.method public static synthetic $r8$lambda$ghZRUvIft-CXXRvejBeZvmQRH7A(Landroidx/window/embedding/EmbeddingCompat;Landroidx/window/extensions/embedding/SplitAttributesCalculatorParams;)Landroidx/window/extensions/embedding/SplitAttributes;
    .locals 0

    invoke-static {p0, p1}, Landroidx/window/embedding/EmbeddingCompat;->setDefaultSplitAttributeCalculatorIfNeeded$lambda$2(Landroidx/window/embedding/EmbeddingCompat;Landroidx/window/extensions/embedding/SplitAttributesCalculatorParams;)Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p0

    return-object p0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Landroidx/window/embedding/EmbeddingCompat$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroidx/window/embedding/EmbeddingCompat$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Landroidx/window/embedding/EmbeddingCompat;->Companion:Landroidx/window/embedding/EmbeddingCompat$Companion;

    return-void
.end method

.method public constructor <init>(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;Landroidx/window/embedding/EmbeddingAdapter;Landroidx/window/core/ConsumerAdapter;Landroid/content/Context;Landroidx/window/embedding/OverlayControllerImpl;Landroidx/window/embedding/ActivityWindowInfoCallbackController;)V
    .locals 1

    const-string v0, "embeddingExtension"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "adapter"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "consumerAdapter"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "applicationContext"

    invoke-static {p4, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    iput-object p1, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 48
    iput-object p2, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    .line 49
    iput-object p3, p0, Landroidx/window/embedding/EmbeddingCompat;->consumerAdapter:Landroidx/window/core/ConsumerAdapter;

    .line 50
    iput-object p4, p0, Landroidx/window/embedding/EmbeddingCompat;->applicationContext:Landroid/content/Context;

    .line 51
    iput-object p5, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    .line 52
    iput-object p6, p0, Landroidx/window/embedding/EmbeddingCompat;->activityWindowInfoCallbackController:Landroidx/window/embedding/ActivityWindowInfoCallbackController;

    .line 55
    sget-object p1, Landroidx/window/WindowSdkExtensions;->Companion:Landroidx/window/WindowSdkExtensions$Companion;

    invoke-virtual {p1}, Landroidx/window/WindowSdkExtensions$Companion;->getInstance()Landroidx/window/WindowSdkExtensions;

    move-result-object p1

    iput-object p1, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    return-void
.end method

.method public static final synthetic access$getAdapter$p(Landroidx/window/embedding/EmbeddingCompat;)Landroidx/window/embedding/EmbeddingAdapter;
    .locals 0

    .line 46
    iget-object p0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    return-object p0
.end method

.method private final invalidateVisibleActivityStacks(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;)V
    .locals 0

    .line 213
    invoke-interface {p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->invalidateTopVisibleSplitAttributes()V

    return-void
.end method

.method private final registerSplitInfoCallback(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;)V
    .locals 1

    .line 114
    new-instance v0, Landroidx/window/embedding/EmbeddingCompat$$ExternalSyntheticLambda0;

    invoke-direct {v0, p1, p0}, Landroidx/window/embedding/EmbeddingCompat$$ExternalSyntheticLambda0;-><init>(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingCompat;)V

    .line 118
    iget-object p1, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    check-cast v0, Landroidx/window/extensions/core/util/function/Consumer;

    invoke-interface {p1, v0}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setSplitInfoCallback(Landroidx/window/extensions/core/util/function/Consumer;)V

    return-void
.end method

.method private static final registerSplitInfoCallback$lambda$0(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingCompat;Ljava/util/List;)V
    .locals 1

    const-string v0, "splitInfoList"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 116
    iget-object p1, p1, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {p1, p2}, Landroidx/window/embedding/EmbeddingAdapter;->translate(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p0, p1}, Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;->onSplitInfoChanged(Ljava/util/List;)V

    return-void
.end method

.method private final setDefaultSplitAttributeCalculatorIfNeeded()V
    .locals 2

    .line 183
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    invoke-virtual {v0}, Landroidx/window/WindowSdkExtensions;->getExtensionVersion()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 184
    iget-boolean v0, p0, Landroidx/window/embedding/EmbeddingCompat;->isCustomSplitAttributeCalculatorSet:Z

    if-nez v0, :cond_0

    .line 185
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {v0}, Landroidx/window/embedding/EmbeddingAdapter;->getEmbeddingConfiguration()Landroidx/window/embedding/EmbeddingConfiguration;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 187
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    new-instance v1, Landroidx/window/embedding/EmbeddingCompat$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0}, Landroidx/window/embedding/EmbeddingCompat$$ExternalSyntheticLambda1;-><init>(Landroidx/window/embedding/EmbeddingCompat;)V

    invoke-interface {v0, v1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setSplitAttributesCalculator(Landroidx/window/extensions/core/util/function/Function;)V

    :cond_0
    return-void
.end method

.method private static final setDefaultSplitAttributeCalculatorIfNeeded$lambda$2(Landroidx/window/embedding/EmbeddingCompat;Landroidx/window/extensions/embedding/SplitAttributesCalculatorParams;)Landroidx/window/extensions/embedding/SplitAttributes;
    .locals 1

    .line 188
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitAttributesCalculatorParams;->areDefaultConstraintsSatisfied()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 189
    iget-object p0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    .line 190
    invoke-virtual {p1}, Landroidx/window/extensions/embedding/SplitAttributesCalculatorParams;->getDefaultSplitAttributes()Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p1

    const-string v0, "getDefaultSplitAttributes(...)"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Landroidx/window/embedding/EmbeddingAdapter;->translate$window_release(Landroidx/window/extensions/embedding/SplitAttributes;)Landroidx/window/embedding/SplitAttributes;

    move-result-object p1

    .line 189
    invoke-virtual {p0, p1}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p0

    return-object p0

    .line 193
    :cond_0
    iget-object p0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    .line 194
    new-instance p1, Landroidx/window/embedding/SplitAttributes$Builder;

    invoke-direct {p1}, Landroidx/window/embedding/SplitAttributes$Builder;-><init>()V

    sget-object v0, Landroidx/window/embedding/SplitAttributes$SplitType;->SPLIT_TYPE_EXPAND:Landroidx/window/embedding/SplitAttributes$SplitType;

    invoke-virtual {p1, v0}, Landroidx/window/embedding/SplitAttributes$Builder;->setSplitType(Landroidx/window/embedding/SplitAttributes$SplitType;)Landroidx/window/embedding/SplitAttributes$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/window/embedding/SplitAttributes$Builder;->build()Landroidx/window/embedding/SplitAttributes;

    move-result-object p1

    .line 193
    invoke-virtual {p0, p1}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public addEmbeddedActivityWindowInfoCallbackForActivity(Landroid/app/Activity;Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/embedding/EmbeddedActivityWindowInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "callback"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 308
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->activityWindowInfoCallbackController:Landroidx/window/embedding/ActivityWindowInfoCallbackController;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Landroidx/window/embedding/ActivityWindowInfoCallbackController;->addCallback(Landroid/app/Activity;Landroidx/core/util/Consumer;)V

    return-void

    .line 309
    :cond_0
    move-object p1, p0

    check-cast p1, Landroidx/window/embedding/EmbeddingCompat;

    .line 311
    const-string p1, "EmbeddingCompat"

    .line 312
    const-string p2, "EmbeddedActivityWindowInfo is not supported on device less than version 6"

    .line 310
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public addOverlayInfoCallback(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/Executor;",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/embedding/OverlayInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "overlayTag"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "executor"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "overlayInfoCallback"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 280
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Landroidx/window/embedding/OverlayControllerImpl;->addOverlayInfoCallback(Ljava/lang/String;Ljava/util/concurrent/Executor;Landroidx/core/util/Consumer;)V

    return-void

    .line 285
    :cond_0
    move-object p2, p0

    check-cast p2, Landroidx/window/embedding/EmbeddingCompat;

    .line 286
    const-string p2, "EmbeddingCompat"

    const-string v0, "overlayInfo is not supported on device less than version 5"

    invoke-static {p2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    new-instance p2, Landroidx/window/embedding/OverlayInfo;

    const/4 v0, 0x0

    invoke-direct {p2, p1, v0, v0}, Landroidx/window/embedding/OverlayInfo;-><init>(Ljava/lang/String;Landroidx/window/embedding/OverlayAttributes;Landroidx/window/embedding/ActivityStack;)V

    .line 288
    invoke-interface {p3, p2}, Landroidx/core/util/Consumer;->accept(Ljava/lang/Object;)V

    return-void
.end method

.method public clearOverlayAttributesCalculator()V
    .locals 2

    .line 262
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 264
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/window/embedding/OverlayControllerImpl;->setOverlayAttributesCalculator$window_release(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public clearSplitAttributesCalculator()V
    .locals 2

    .line 154
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 156
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-interface {v0}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->clearSplitAttributesCalculator()V

    const/4 v0, 0x0

    .line 157
    iput-boolean v0, p0, Landroidx/window/embedding/EmbeddingCompat;->isCustomSplitAttributeCalculatorSet:Z

    .line 158
    invoke-direct {p0}, Landroidx/window/embedding/EmbeddingCompat;->setDefaultSplitAttributeCalculatorIfNeeded()V

    return-void
.end method

.method public finishActivityStacks(Ljava/util/Set;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/window/embedding/ActivityStack;",
            ">;)V"
        }
    .end annotation

    const-string v0, "activityStacks"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 163
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 165
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 166
    check-cast p1, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    check-cast v1, Ljava/util/Set;

    check-cast v1, Ljava/util/Collection;

    .line 376
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 377
    check-cast v2, Landroidx/window/embedding/ActivityStack;

    .line 166
    invoke-virtual {v2}, Landroidx/window/embedding/ActivityStack;->getToken$window_release()Landroidx/window/extensions/embedding/ActivityStack$Token;

    move-result-object v2

    .line 377
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 378
    :cond_0
    check-cast v1, Ljava/util/Set;

    .line 165
    invoke-interface {v0, v1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->finishActivityStacksWithTokens(Ljava/util/Set;)V

    return-void
.end method

.method public final getOverlayController$window_release()Landroidx/window/embedding/OverlayControllerImpl;
    .locals 1

    .line 51
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    return-object v0
.end method

.method public invalidateVisibleActivityStacks()V
    .locals 2

    .line 202
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 204
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-direct {p0, v0}, Landroidx/window/embedding/EmbeddingCompat;->invalidateVisibleActivityStacks(Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;)V

    return-void
.end method

.method public isActivityEmbedded(Landroid/app/Activity;)Z
    .locals 1

    const-string v0, "activity"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 122
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-interface {v0, p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->isActivityEmbedded(Landroid/app/Activity;)Z

    move-result p1

    return p1
.end method

.method public pinTopActivityStack(ILandroidx/window/embedding/SplitPinRule;)Z
    .locals 3

    const-string v0, "splitPinRule"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 128
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 130
    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    iget-object v2, p0, Landroidx/window/embedding/EmbeddingCompat;->applicationContext:Landroid/content/Context;

    invoke-virtual {v1, v2, p2}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitPinRule(Landroid/content/Context;Landroidx/window/embedding/SplitPinRule;)Landroidx/window/extensions/embedding/SplitPinRule;

    move-result-object p2

    .line 128
    invoke-interface {v0, p1, p2}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->pinTopActivityStack(ILandroidx/window/extensions/embedding/SplitPinRule;)Z

    move-result p1

    return p1
.end method

.method public removeEmbeddedActivityWindowInfoCallbackForActivity(Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/embedding/EmbeddedActivityWindowInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "callback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 321
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->activityWindowInfoCallbackController:Landroidx/window/embedding/ActivityWindowInfoCallbackController;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/window/embedding/ActivityWindowInfoCallbackController;->removeCallback(Landroidx/core/util/Consumer;)V

    :cond_0
    return-void
.end method

.method public removeOverlayInfoCallback(Landroidx/core/util/Consumer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/core/util/Consumer<",
            "Landroidx/window/embedding/OverlayInfo;",
            ">;)V"
        }
    .end annotation

    const-string v0, "overlayInfoCallback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 300
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroidx/window/embedding/OverlayControllerImpl;->removeOverlayInfoCallback(Landroidx/core/util/Consumer;)V

    :cond_0
    return-void
.end method

.method public setEmbeddingCallback(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;)V
    .locals 4

    const-string v0, "embeddingCallback"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 87
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    invoke-virtual {v0}, Landroidx/window/WindowSdkExtensions;->getExtensionVersion()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 89
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->consumerAdapter:Landroidx/window/core/ConsumerAdapter;

    .line 90
    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    const-class v2, Ljava/util/List;

    invoke-static {v2}, Lkotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lkotlin/reflect/KClass;

    move-result-object v2

    .line 89
    new-instance v3, Landroidx/window/embedding/EmbeddingCompat$setEmbeddingCallback$1;

    invoke-direct {v3, p1, p0}, Landroidx/window/embedding/EmbeddingCompat$setEmbeddingCallback$1;-><init>(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingCompat;)V

    check-cast v3, Lkotlin/jvm/functions/Function1;

    const-string p1, "setSplitInfoCallback"

    invoke-virtual {v0, v1, v2, p1, v3}, Landroidx/window/core/ConsumerAdapter;->addConsumer(Ljava/lang/Object;Lkotlin/reflect/KClass;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    return-void

    :cond_0
    const/4 v1, 0x2

    const/4 v2, 0x5

    if-gt v1, v0, :cond_1

    if-ge v0, v2, :cond_1

    .line 99
    invoke-direct {p0, p1}, Landroidx/window/embedding/EmbeddingCompat;->registerSplitInfoCallback(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;)V

    return-void

    :cond_1
    if-gt v2, v0, :cond_2

    const v1, 0x7fffffff

    if-gt v0, v1, :cond_2

    .line 102
    invoke-direct {p0, p1}, Landroidx/window/embedding/EmbeddingCompat;->registerSplitInfoCallback(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;)V

    .line 105
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 106
    new-instance v1, Landroidx/profileinstaller/ProfileInstallReceiver$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Landroidx/profileinstaller/ProfileInstallReceiver$$ExternalSyntheticLambda0;-><init>()V

    .line 107
    new-instance v2, Landroidx/window/embedding/ActivityStackConsumer;

    iget-object v3, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-direct {v2, p1, v3}, Landroidx/window/embedding/ActivityStackConsumer;-><init>(Landroidx/window/embedding/EmbeddingInterfaceCompat$EmbeddingCallbackInterface;Landroidx/window/embedding/EmbeddingAdapter;)V

    check-cast v2, Landroidx/window/extensions/core/util/function/Consumer;

    .line 105
    invoke-interface {v0, v1, v2}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->registerActivityStackCallback(Ljava/util/concurrent/Executor;Landroidx/window/extensions/core/util/function/Consumer;)V

    :cond_2
    return-void
.end method

.method public setEmbeddingConfiguration(Landroidx/window/embedding/EmbeddingConfiguration;)V
    .locals 2

    const-string v0, "embeddingConfig"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 172
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 173
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {v0, p1}, Landroidx/window/embedding/EmbeddingAdapter;->setEmbeddingConfiguration(Landroidx/window/embedding/EmbeddingConfiguration;)V

    .line 174
    invoke-direct {p0}, Landroidx/window/embedding/EmbeddingCompat;->setDefaultSplitAttributeCalculatorIfNeeded()V

    .line 176
    iget-object p1, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-interface {p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->invalidateTopVisibleSplitAttributes()V

    return-void
.end method

.method public setLaunchingActivityStack(Landroid/os/Bundle;Landroidx/window/embedding/ActivityStack;)Landroid/os/Bundle;
    .locals 2

    const-string v0, "options"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "activityStack"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 236
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 238
    sget-object v0, Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;->INSTANCE:Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;

    invoke-virtual {p2}, Landroidx/window/embedding/ActivityStack;->getToken$window_release()Landroidx/window/extensions/embedding/ActivityStack$Token;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;->setActivityStackToken$window_release(Landroid/os/Bundle;Landroidx/window/extensions/embedding/ActivityStack$Token;)V

    return-object p1
.end method

.method public setOverlayAttributesCalculator(Lkotlin/jvm/functions/Function1;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/window/embedding/OverlayAttributesCalculatorParams;",
            "Landroidx/window/embedding/OverlayAttributes;",
            ">;)V"
        }
    .end annotation

    const-string v0, "calculator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 255
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 257
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1}, Landroidx/window/embedding/OverlayControllerImpl;->setOverlayAttributesCalculator$window_release(Lkotlin/jvm/functions/Function1;)V

    return-void
.end method

.method public setOverlayCreateParams(Landroid/os/Bundle;Landroidx/window/embedding/OverlayCreateParams;)Landroid/os/Bundle;
    .locals 1

    const-string v0, "options"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "overlayCreateParams"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 248
    sget-object v0, Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;->INSTANCE:Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;

    invoke-virtual {v0, p1, p2}, Landroidx/window/embedding/ActivityEmbeddingOptionsImpl;->setOverlayCreateParams$window_release(Landroid/os/Bundle;Landroidx/window/embedding/OverlayCreateParams;)V

    return-object p1
.end method

.method public setRules(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "+",
            "Landroidx/window/embedding/EmbeddingRule;",
            ">;)V"
        }
    .end annotation

    const-string v0, "rules"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 61
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/window/embedding/EmbeddingRule;

    .line 62
    instance-of v1, v1, Landroidx/window/embedding/SplitRule;

    if-eqz v1, :cond_0

    .line 69
    sget-object v0, Landroidx/window/embedding/SplitController;->Companion:Landroidx/window/embedding/SplitController$Companion;

    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Landroidx/window/embedding/SplitController$Companion;->getInstance(Landroid/content/Context;)Landroidx/window/embedding/SplitController;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/window/embedding/SplitController;->getSplitSupportStatus()Landroidx/window/embedding/SplitController$SplitSupportStatus;

    move-result-object v0

    .line 70
    sget-object v1, Landroidx/window/embedding/SplitController$SplitSupportStatus;->SPLIT_AVAILABLE:Landroidx/window/embedding/SplitController$SplitSupportStatus;

    .line 69
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 72
    sget-object p1, Landroidx/window/core/BuildConfig;->INSTANCE:Landroidx/window/core/BuildConfig;

    invoke-virtual {p1}, Landroidx/window/core/BuildConfig;->getVerificationMode()Landroidx/window/core/VerificationMode;

    move-result-object p1

    sget-object v0, Landroidx/window/core/VerificationMode;->LOG:Landroidx/window/core/VerificationMode;

    if-ne p1, v0, :cond_1

    .line 74
    const-string p1, "EmbeddingCompat"

    .line 75
    const-string v0, "Cannot set SplitRule because ActivityEmbedding Split is not supported or PROPERTY_ACTIVITY_EMBEDDING_SPLITS_ENABLED is not set."

    .line 73
    invoke-static {p1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void

    .line 82
    :cond_2
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->applicationContext:Landroid/content/Context;

    invoke-virtual {v0, v1, p1}, Landroidx/window/embedding/EmbeddingAdapter;->translate(Landroid/content/Context;Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    .line 83
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-interface {v0, p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setEmbeddingRules(Ljava/util/Set;)V

    return-void
.end method

.method public setSplitAttributesCalculator(Lkotlin/jvm/functions/Function1;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/jvm/functions/Function1<",
            "-",
            "Landroidx/window/embedding/SplitAttributesCalculatorParams;",
            "Landroidx/window/embedding/SplitAttributes;",
            ">;)V"
        }
    .end annotation

    const-string v0, "calculator"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 146
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 147
    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {v1, p1}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitAttributesCalculator(Lkotlin/jvm/functions/Function1;)Landroidx/window/reflection/JFunction2;

    move-result-object p1

    check-cast p1, Landroidx/window/extensions/core/util/function/Function;

    .line 146
    invoke-interface {v0, p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->setSplitAttributesCalculator(Landroidx/window/extensions/core/util/function/Function;)V

    const/4 p1, 0x1

    .line 149
    iput-boolean p1, p0, Landroidx/window/embedding/EmbeddingCompat;->isCustomSplitAttributeCalculatorSet:Z

    return-void
.end method

.method public unpinTopActivityStack(I)V
    .locals 2

    .line 136
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x5

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 137
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    invoke-interface {v0, p1}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->unpinTopActivityStack(I)V

    return-void
.end method

.method public updateOverlayAttributes(Ljava/lang/String;Landroidx/window/embedding/OverlayAttributes;)V
    .locals 2

    const-string v0, "overlayTag"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "overlayAttributes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 269
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 271
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->overlayController:Landroidx/window/embedding/OverlayControllerImpl;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-virtual {v0, p1, p2}, Landroidx/window/embedding/OverlayControllerImpl;->updateOverlayAttributes$window_release(Ljava/lang/String;Landroidx/window/embedding/OverlayAttributes;)V

    return-void
.end method

.method public updateSplitAttributes(Landroidx/window/embedding/SplitInfo;Landroidx/window/embedding/SplitAttributes;)V
    .locals 2

    const-string v0, "splitInfo"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "splitAttributes"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 219
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroidx/window/WindowSdkExtensions;->requireExtensionVersion$window_release(I)V

    .line 221
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->windowSdkExtensions:Landroidx/window/WindowSdkExtensions;

    invoke-virtual {v0}, Landroidx/window/WindowSdkExtensions;->getExtensionVersion()I

    move-result v0

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 222
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 223
    invoke-virtual {p1}, Landroidx/window/embedding/SplitInfo;->getToken$window_release()Landroidx/window/extensions/embedding/SplitInfo$Token;

    move-result-object p1

    .line 224
    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {v1, p2}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p2

    .line 222
    invoke-interface {v0, p1, p2}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->updateSplitAttributes(Landroidx/window/extensions/embedding/SplitInfo$Token;Landroidx/window/extensions/embedding/SplitAttributes;)V

    return-void

    .line 227
    :cond_0
    iget-object v0, p0, Landroidx/window/embedding/EmbeddingCompat;->embeddingExtension:Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;

    .line 228
    invoke-virtual {p1}, Landroidx/window/embedding/SplitInfo;->getBinder$window_release()Landroid/os/IBinder;

    move-result-object p1

    .line 229
    iget-object v1, p0, Landroidx/window/embedding/EmbeddingCompat;->adapter:Landroidx/window/embedding/EmbeddingAdapter;

    invoke-virtual {v1, p2}, Landroidx/window/embedding/EmbeddingAdapter;->translateSplitAttributes(Landroidx/window/embedding/SplitAttributes;)Landroidx/window/extensions/embedding/SplitAttributes;

    move-result-object p2

    .line 227
    invoke-interface {v0, p1, p2}, Landroidx/window/extensions/embedding/ActivityEmbeddingComponent;->updateSplitAttributes(Landroid/os/IBinder;Landroidx/window/extensions/embedding/SplitAttributes;)V

    return-void
.end method
