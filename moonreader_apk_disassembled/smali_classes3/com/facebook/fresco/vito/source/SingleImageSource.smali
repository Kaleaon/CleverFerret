.class public interface abstract Lcom/facebook/fresco/vito/source/SingleImageSource;
.super Ljava/lang/Object;
.source "SingleImageSource.kt"

# interfaces
.implements Lcom/facebook/fresco/vito/source/UriImageSource;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001J\u0012\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u0008\u001a\u00020\u0007H&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/facebook/fresco/vito/source/SingleImageSource;",
        "Lcom/facebook/fresco/vito/source/UriImageSource;",
        "uri",
        "Landroid/net/Uri;",
        "getUri",
        "()Landroid/net/Uri;",
        "getStringExtra",
        "",
        "key",
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


# virtual methods
.method public abstract getStringExtra(Ljava/lang/String;)Ljava/lang/String;
.end method

.method public abstract getUri()Landroid/net/Uri;
.end method
