.class public final Lcom/facebook/imageformat/ImageFormatChecker;
.super Ljava/lang/Object;
.source "ImageFormatChecker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/imageformat/ImageFormatChecker$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nImageFormatChecker.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ImageFormatChecker.kt\ncom/facebook/imageformat/ImageFormatChecker\n+ 2 _Collections.kt\nkotlin/collections/CollectionsKt___CollectionsKt\n*L\n1#1,169:1\n1863#2,2:170\n*S KotlinDebug\n*F\n+ 1 ImageFormatChecker.kt\ncom/facebook/imageformat/ImageFormatChecker\n*L\n59#1:170,2\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00152\u00020\u0001:\u0001\u0015B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\r\u001a\u00020\u00002\u000e\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007J\u000e\u0010\u000e\u001a\u00020\u00002\u0006\u0010\u000b\u001a\u00020\u000cJ\u000e\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0012J\u0008\u0010\u0013\u001a\u00020\u0014H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u0006\u001a\n\u0012\u0004\u0012\u00020\u0008\u0018\u00010\u0007X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u000cX\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/facebook/imageformat/ImageFormatChecker;",
        "",
        "<init>",
        "()V",
        "maxHeaderLength",
        "",
        "customImageFormatCheckers",
        "",
        "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
        "defaultFormatChecker",
        "Lcom/facebook/imageformat/DefaultImageFormatChecker;",
        "binaryXmlEnabled",
        "",
        "setCustomImageFormatCheckers",
        "setBinaryXmlEnabled",
        "determineImageFormat",
        "Lcom/facebook/imageformat/ImageFormat;",
        "is",
        "Ljava/io/InputStream;",
        "updateMaxHeaderLength",
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


# static fields
.field public static final Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

.field private static final instance$delegate:Lkotlin/Lazy;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/Lazy<",
            "Lcom/facebook/imageformat/ImageFormatChecker;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private binaryXmlEnabled:Z

.field private customImageFormatCheckers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
            ">;"
        }
    .end annotation
.end field

.field private final defaultFormatChecker:Lcom/facebook/imageformat/DefaultImageFormatChecker;

.field private maxHeaderLength:I


# direct methods
.method public static synthetic $r8$lambda$zJcyccJ6CBjI-jyZLRfI2NNPi50()Lcom/facebook/imageformat/ImageFormatChecker;
    .locals 1

    invoke-static {}, Lcom/facebook/imageformat/ImageFormatChecker;->instance_delegate$lambda$2()Lcom/facebook/imageformat/ImageFormatChecker;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    .line 118
    sget-object v0, Lkotlin/LazyThreadSafetyMode;->SYNCHRONIZED:Lkotlin/LazyThreadSafetyMode;

    new-instance v1, Lcom/facebook/imageformat/ImageFormatChecker$$ExternalSyntheticLambda0;

    invoke-direct {v1}, Lcom/facebook/imageformat/ImageFormatChecker$$ExternalSyntheticLambda0;-><init>()V

    invoke-static {v0, v1}, Lkotlin/LazyKt;->lazy(Lkotlin/LazyThreadSafetyMode;Lkotlin/jvm/functions/Function0;)Lkotlin/Lazy;

    move-result-object v0

    sput-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->instance$delegate:Lkotlin/Lazy;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    new-instance v0, Lcom/facebook/imageformat/DefaultImageFormatChecker;

    invoke-direct {v0}, Lcom/facebook/imageformat/DefaultImageFormatChecker;-><init>()V

    iput-object v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->defaultFormatChecker:Lcom/facebook/imageformat/DefaultImageFormatChecker;

    .line 27
    invoke-direct {p0}, Lcom/facebook/imageformat/ImageFormatChecker;->updateMaxHeaderLength()V

    return-void
.end method

.method public static final synthetic access$getInstance$delegate$cp()Lkotlin/Lazy;
    .locals 1

    .line 19
    sget-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->instance$delegate:Lkotlin/Lazy;

    return-object v0
.end method

.method public static final getImageFormat(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;->getImageFormat(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object p0

    return-object p0
.end method

.method public static final getImageFormat(Ljava/lang/String;)Lcom/facebook/imageformat/ImageFormat;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;->getImageFormat(Ljava/lang/String;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object p0

    return-object p0
.end method

.method public static final getImageFormat_WrapIOException(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    invoke-virtual {v0, p0}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;->getImageFormat_WrapIOException(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;

    move-result-object p0

    return-object p0
.end method

.method public static final getInstance()Lcom/facebook/imageformat/ImageFormatChecker;
    .locals 1
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    sget-object v0, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    invoke-virtual {v0}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;->getInstance()Lcom/facebook/imageformat/ImageFormatChecker;

    move-result-object v0

    return-object v0
.end method

.method private static final instance_delegate$lambda$2()Lcom/facebook/imageformat/ImageFormatChecker;
    .locals 1

    .line 118
    new-instance v0, Lcom/facebook/imageformat/ImageFormatChecker;

    invoke-direct {v0}, Lcom/facebook/imageformat/ImageFormatChecker;-><init>()V

    return-object v0
.end method

.method private final updateMaxHeaderLength()V
    .locals 3

    .line 69
    iget-object v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->defaultFormatChecker:Lcom/facebook/imageformat/DefaultImageFormatChecker;

    invoke-virtual {v0}, Lcom/facebook/imageformat/DefaultImageFormatChecker;->getHeaderSize()I

    move-result v0

    iput v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->maxHeaderLength:I

    .line 70
    iget-object v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->customImageFormatCheckers:Ljava/util/List;

    if-eqz v0, :cond_0

    .line 71
    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/facebook/imageformat/ImageFormat$FormatChecker;

    .line 72
    iget v2, p0, Lcom/facebook/imageformat/ImageFormatChecker;->maxHeaderLength:I

    invoke-interface {v1}, Lcom/facebook/imageformat/ImageFormat$FormatChecker;->getHeaderSize()I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/facebook/imageformat/ImageFormatChecker;->maxHeaderLength:I

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public final determineImageFormat(Ljava/io/InputStream;)Lcom/facebook/imageformat/ImageFormat;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "is"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 45
    iget v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->maxHeaderLength:I

    new-array v1, v0, [B

    .line 46
    sget-object v2, Lcom/facebook/imageformat/ImageFormatChecker;->Companion:Lcom/facebook/imageformat/ImageFormatChecker$Companion;

    invoke-static {v2, v0, p1, v1}, Lcom/facebook/imageformat/ImageFormatChecker$Companion;->access$readHeaderFromStream(Lcom/facebook/imageformat/ImageFormatChecker$Companion;ILjava/io/InputStream;[B)I

    move-result p1

    .line 48
    iget-object v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->defaultFormatChecker:Lcom/facebook/imageformat/DefaultImageFormatChecker;

    invoke-virtual {v0, v1, p1}, Lcom/facebook/imageformat/DefaultImageFormatChecker;->determineFormat([BI)Lcom/facebook/imageformat/ImageFormat;

    move-result-object v0

    .line 50
    sget-object v2, Lcom/facebook/imageformat/DefaultImageFormats;->BINARY_XML:Lcom/facebook/imageformat/ImageFormat;

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-boolean v2, p0, Lcom/facebook/imageformat/ImageFormatChecker;->binaryXmlEnabled:Z

    if-nez v2, :cond_0

    .line 51
    sget-object v0, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    .line 56
    :cond_0
    sget-object v2, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    if-eq v0, v2, :cond_1

    return-object v0

    .line 59
    :cond_1
    iget-object v0, p0, Lcom/facebook/imageformat/ImageFormatChecker;->customImageFormatCheckers:Ljava/util/List;

    if-eqz v0, :cond_3

    check-cast v0, Ljava/lang/Iterable;

    .line 170
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/facebook/imageformat/ImageFormat$FormatChecker;

    .line 60
    invoke-interface {v2, v1, p1}, Lcom/facebook/imageformat/ImageFormat$FormatChecker;->determineFormat([BI)Lcom/facebook/imageformat/ImageFormat;

    move-result-object v2

    .line 61
    sget-object v3, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    if-eq v2, v3, :cond_2

    return-object v2

    .line 65
    :cond_3
    sget-object p1, Lcom/facebook/imageformat/ImageFormat;->UNKNOWN:Lcom/facebook/imageformat/ImageFormat;

    return-object p1
.end method

.method public final setBinaryXmlEnabled(Z)Lcom/facebook/imageformat/ImageFormatChecker;
    .locals 0

    .line 39
    iput-boolean p1, p0, Lcom/facebook/imageformat/ImageFormatChecker;->binaryXmlEnabled:Z

    return-object p0
.end method

.method public final setCustomImageFormatCheckers(Ljava/util/List;)Lcom/facebook/imageformat/ImageFormatChecker;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/facebook/imageformat/ImageFormat$FormatChecker;",
            ">;)",
            "Lcom/facebook/imageformat/ImageFormatChecker;"
        }
    .end annotation

    .line 33
    iput-object p1, p0, Lcom/facebook/imageformat/ImageFormatChecker;->customImageFormatCheckers:Ljava/util/List;

    .line 34
    invoke-direct {p0}, Lcom/facebook/imageformat/ImageFormatChecker;->updateMaxHeaderLength()V

    return-object p0
.end method
