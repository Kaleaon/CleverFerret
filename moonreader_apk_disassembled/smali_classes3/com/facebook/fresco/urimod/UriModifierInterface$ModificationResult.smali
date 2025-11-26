.class public abstract Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;
.super Ljava/lang/Object;
.source "UriModifierInterface.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/fresco/urimod/UriModifierInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "ModificationResult"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Disabled;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToMbpDiskCache;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToMbpMemoryCache;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToOriginalUrl;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;,
        Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u00086\u0018\u00002\u00020\u0001:\u0006\u000b\u000c\r\u000e\u000f\u0010B\u0011\u0008\u0004\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\n\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0008\u0010\t\u0082\u0001\u0006\u0011\u0012\u0013\u0014\u0015\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;",
        "",
        "comment",
        "",
        "<init>",
        "(Ljava/lang/String;)V",
        "bestAllowlistedSize",
        "",
        "getBestAllowlistedSize",
        "()Ljava/lang/Integer;",
        "toString",
        "Disabled",
        "Modified",
        "FallbackToOriginalUrl",
        "Unmodified",
        "FallbackToMbpMemoryCache",
        "FallbackToMbpDiskCache",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Disabled;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToMbpDiskCache;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToMbpMemoryCache;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$FallbackToOriginalUrl;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Unmodified;",
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


# instance fields
.field private final comment:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;->comment:Ljava/lang/String;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;Lkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;-><init>(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public abstract getBestAllowlistedSize()Ljava/lang/Integer;
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 34
    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult;->comment:Ljava/lang/String;

    return-object v0
.end method
