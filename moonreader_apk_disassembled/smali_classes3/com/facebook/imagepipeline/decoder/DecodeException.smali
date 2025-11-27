.class public final Lcom/facebook/imagepipeline/decoder/DecodeException;
.super Ljava/lang/RuntimeException;
.source "DecodeException.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0003\n\u0002\u0008\u0004\u0018\u00002\u00060\u0002j\u0002`\u0001B\u001b\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008B%\u0008\u0016\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0004\u0012\u0008\u0010\t\u001a\u0004\u0018\u00010\n\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u000bR\u0011\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u000e"
    }
    d2 = {
        "Lcom/facebook/imagepipeline/decoder/DecodeException;",
        "Lkotlin/RuntimeException;",
        "Ljava/lang/RuntimeException;",
        "message",
        "",
        "encodedImage",
        "Lcom/facebook/imagepipeline/image/EncodedImage;",
        "<init>",
        "(Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;)V",
        "t",
        "",
        "(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/imagepipeline/image/EncodedImage;)V",
        "getEncodedImage",
        "()Lcom/facebook/imagepipeline/image/EncodedImage;",
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


# instance fields
.field private final encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 1

    const-string v0, "encodedImage"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 16
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 17
    iput-object p2, p0, Lcom/facebook/imagepipeline/decoder/DecodeException;->encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/facebook/imagepipeline/image/EncodedImage;)V
    .locals 1

    const-string v0, "encodedImage"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    invoke-direct {p0, p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 21
    iput-object p3, p0, Lcom/facebook/imagepipeline/decoder/DecodeException;->encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    return-void
.end method


# virtual methods
.method public final getEncodedImage()Lcom/facebook/imagepipeline/image/EncodedImage;
    .locals 1

    .line 14
    iget-object v0, p0, Lcom/facebook/imagepipeline/decoder/DecodeException;->encodedImage:Lcom/facebook/imagepipeline/image/EncodedImage;

    return-object v0
.end method
