.class public interface abstract Lcom/facebook/fresco/urimod/UriModifierInterface;
.super Ljava/lang/Object;
.source "UriModifierInterface.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/urimod/UriModifierInterface$DefaultImpls;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0002\u0008f\u0018\u00002\u00020\u0001:\u0001\u0014JD\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0010\n\u001a\u0004\u0018\u00010\u00012\n\u0008\u0002\u0010\u000b\u001a\u0004\u0018\u00010\u000c2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000eH&J\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u00102\u0006\u0010\u0011\u001a\u00020\u00102\u0008\u0010\n\u001a\u0004\u0018\u00010\u0001H&J\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0011\u001a\u00020\u0010H&\u00a8\u0006\u0015"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/UriModifierInterface;",
        "",
        "modifyUri",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;",
        "imageSource",
        "Lcom/facebook/fresco/vito/source/UriImageSource;",
        "viewport",
        "Lcom/facebook/fresco/urimod/Dimensions;",
        "scaleType",
        "Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;",
        "callerContext",
        "contextChain",
        "Lcom/facebook/common/callercontext/ContextChain;",
        "forLoggingOnly",
        "",
        "modifyPrefetchUri",
        "Landroid/net/Uri;",
        "uri",
        "unregisterReverseFallbackUri",
        "",
        "ModificationResult",
        "urimod_release"
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
.method public abstract modifyPrefetchUri(Landroid/net/Uri;Ljava/lang/Object;)Landroid/net/Uri;
.end method

.method public abstract modifyUri(Lcom/facebook/fresco/vito/source/UriImageSource;Lcom/facebook/fresco/urimod/Dimensions;Lcom/facebook/drawee/drawable/ScalingUtils$ScaleType;Ljava/lang/Object;Lcom/facebook/common/callercontext/ContextChain;Z)Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;
.end method

.method public abstract unregisterReverseFallbackUri(Landroid/net/Uri;)V
.end method
