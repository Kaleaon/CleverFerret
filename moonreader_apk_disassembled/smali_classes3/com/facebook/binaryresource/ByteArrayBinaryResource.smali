.class public final Lcom/facebook/binaryresource/ByteArrayBinaryResource;
.super Ljava/lang/Object;
.source "ByteArrayBinaryResource.kt"

# interfaces
.implements Lcom/facebook/binaryresource/BinaryResource;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u0008\u001a\u00020\tH\u0016J\u0008\u0010\n\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/binaryresource/ByteArrayBinaryResource;",
        "Lcom/facebook/binaryresource/BinaryResource;",
        "bytes",
        "",
        "<init>",
        "([B)V",
        "size",
        "",
        "openStream",
        "Ljava/io/InputStream;",
        "read",
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


# instance fields
.field private final bytes:[B


# direct methods
.method public constructor <init>([B)V
    .locals 1

    const-string v0, "bytes"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/binaryresource/ByteArrayBinaryResource;->bytes:[B

    return-void
.end method


# virtual methods
.method public openStream()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 19
    new-instance v0, Ljava/io/ByteArrayInputStream;

    iget-object v1, p0, Lcom/facebook/binaryresource/ByteArrayBinaryResource;->bytes:[B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    check-cast v0, Ljava/io/InputStream;

    return-object v0
.end method

.method public read()[B
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/facebook/binaryresource/ByteArrayBinaryResource;->bytes:[B

    return-object v0
.end method

.method public size()J
    .locals 2

    .line 17
    iget-object v0, p0, Lcom/facebook/binaryresource/ByteArrayBinaryResource;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method
