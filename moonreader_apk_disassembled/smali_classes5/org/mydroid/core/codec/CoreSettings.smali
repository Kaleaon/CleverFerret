.class public Lorg/mydroid/core/codec/CoreSettings;
.super Ljava/lang/Object;
.source "CoreSettings.java"


# static fields
.field private static current:Lorg/mydroid/core/codec/CoreSettings;


# instance fields
.field public animateScrolling:Z

.field public bitmapFileringEnabled:Z

.field public bitmapSize:I

.field public decodingThreadPriority:I

.field public djvuRenderingMode:I

.field public drawThreadPriority:I

.field public fullScreen:Z

.field public pagesInMemory:I

.field public pdfStorageSize:I

.field public reloadDuringZoom:Z

.field public showAnimIcon:Z

.field public tapsEnabled:Z

.field public textureReuseEnabled:Z


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Lorg/mydroid/core/codec/CoreSettings;->fullScreen:Z

    .line 34
    iput-boolean v0, p0, Lorg/mydroid/core/codec/CoreSettings;->showAnimIcon:Z

    const/4 v1, 0x1

    .line 37
    iput-boolean v1, p0, Lorg/mydroid/core/codec/CoreSettings;->animateScrolling:Z

    const/4 v1, 0x2

    .line 40
    iput v1, p0, Lorg/mydroid/core/codec/CoreSettings;->pagesInMemory:I

    const/4 v1, 0x5

    .line 41
    iput v1, p0, Lorg/mydroid/core/codec/CoreSettings;->decodingThreadPriority:I

    .line 42
    iput v1, p0, Lorg/mydroid/core/codec/CoreSettings;->drawThreadPriority:I

    const/16 v1, 0x9

    .line 44
    iput v1, p0, Lorg/mydroid/core/codec/CoreSettings;->bitmapSize:I

    .line 45
    iput-boolean v0, p0, Lorg/mydroid/core/codec/CoreSettings;->bitmapFileringEnabled:Z

    .line 46
    iput-boolean v0, p0, Lorg/mydroid/core/codec/CoreSettings;->textureReuseEnabled:Z

    .line 47
    iput-boolean v0, p0, Lorg/mydroid/core/codec/CoreSettings;->reloadDuringZoom:Z

    const/16 v1, 0x40

    .line 48
    iput v1, p0, Lorg/mydroid/core/codec/CoreSettings;->pdfStorageSize:I

    .line 51
    iput v0, p0, Lorg/mydroid/core/codec/CoreSettings;->djvuRenderingMode:I

    return-void
.end method

.method public static get()Lorg/mydroid/core/codec/CoreSettings;
    .locals 1

    .line 57
    invoke-static {}, Lorg/mydroid/core/codec/CoreSettings;->getInstance()Lorg/mydroid/core/codec/CoreSettings;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lorg/mydroid/core/codec/CoreSettings;
    .locals 1

    .line 61
    sget-object v0, Lorg/mydroid/core/codec/CoreSettings;->current:Lorg/mydroid/core/codec/CoreSettings;

    if-nez v0, :cond_0

    .line 62
    new-instance v0, Lorg/mydroid/core/codec/CoreSettings;

    invoke-direct {v0}, Lorg/mydroid/core/codec/CoreSettings;-><init>()V

    sput-object v0, Lorg/mydroid/core/codec/CoreSettings;->current:Lorg/mydroid/core/codec/CoreSettings;

    .line 64
    :cond_0
    sget-object v0, Lorg/mydroid/core/codec/CoreSettings;->current:Lorg/mydroid/core/codec/CoreSettings;

    return-object v0
.end method
