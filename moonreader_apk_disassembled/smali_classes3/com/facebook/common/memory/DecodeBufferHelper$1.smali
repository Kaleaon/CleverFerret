.class Lcom/facebook/common/memory/DecodeBufferHelper$1;
.super Ljava/lang/ThreadLocal;
.source "DecodeBufferHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/common/memory/DecodeBufferHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal<",
        "Ljava/nio/ByteBuffer;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .line 33
    invoke-virtual {p0}, Lcom/facebook/common/memory/DecodeBufferHelper$1;->initialValue()Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Ljava/nio/ByteBuffer;
    .locals 1

    .line 36
    invoke-static {}, Lcom/facebook/common/memory/DecodeBufferHelper;->-$$Nest$sfgetsRecommendedDecodeBufferSize()I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method
