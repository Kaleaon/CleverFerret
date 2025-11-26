.class public Lcom/facebook/common/memory/DecodeBufferHelper;
.super Ljava/lang/Object;
.source "DecodeBufferHelper.java"

# interfaces
.implements Landroidx/core/util/Pools$Pool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroidx/core/util/Pools$Pool<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# static fields
.field private static final DEFAULT_DECODE_BUFFER_SIZE:I = 0x4000

.field public static final INSTANCE:Lcom/facebook/common/memory/DecodeBufferHelper;

.field private static final sBuffer:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private static sRecommendedDecodeBufferSize:I


# direct methods
.method static bridge synthetic -$$Nest$sfgetsRecommendedDecodeBufferSize()I
    .locals 1

    sget v0, Lcom/facebook/common/memory/DecodeBufferHelper;->sRecommendedDecodeBufferSize:I

    return v0
.end method

.method static constructor <clinit>()V
    .locals 1

    .line 18
    new-instance v0, Lcom/facebook/common/memory/DecodeBufferHelper;

    invoke-direct {v0}, Lcom/facebook/common/memory/DecodeBufferHelper;-><init>()V

    sput-object v0, Lcom/facebook/common/memory/DecodeBufferHelper;->INSTANCE:Lcom/facebook/common/memory/DecodeBufferHelper;

    const/16 v0, 0x4000

    .line 22
    sput v0, Lcom/facebook/common/memory/DecodeBufferHelper;->sRecommendedDecodeBufferSize:I

    .line 32
    new-instance v0, Lcom/facebook/common/memory/DecodeBufferHelper$1;

    invoke-direct {v0}, Lcom/facebook/common/memory/DecodeBufferHelper$1;-><init>()V

    sput-object v0, Lcom/facebook/common/memory/DecodeBufferHelper;->sBuffer:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getRecommendedDecodeBufferSize()I
    .locals 1

    .line 25
    sget v0, Lcom/facebook/common/memory/DecodeBufferHelper;->sRecommendedDecodeBufferSize:I

    return v0
.end method

.method public static setRecommendedDecodeBufferSize(I)V
    .locals 0

    .line 29
    sput p0, Lcom/facebook/common/memory/DecodeBufferHelper;->sRecommendedDecodeBufferSize:I

    return-void
.end method


# virtual methods
.method public bridge synthetic acquire()Ljava/lang/Object;
    .locals 1

    .line 15
    invoke-virtual {p0}, Lcom/facebook/common/memory/DecodeBufferHelper;->acquire()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public acquire()Ljava/nio/ByteBuffer;
    .locals 1

    .line 42
    sget-object v0, Lcom/facebook/common/memory/DecodeBufferHelper;->sBuffer:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method public bridge synthetic release(Ljava/lang/Object;)Z
    .locals 0

    .line 15
    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1}, Lcom/facebook/common/memory/DecodeBufferHelper;->release(Ljava/nio/ByteBuffer;)Z

    move-result p1

    return p1
.end method

.method public release(Ljava/nio/ByteBuffer;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
