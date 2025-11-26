.class public final Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified$ModifiedToAllowlistedSize;
.super Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;
.source "UriModifierInterface.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ModifiedToAllowlistedSize"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0006\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0018\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0096\u0004\u00a2\u0006\n\n\u0002\u0010\n\u001a\u0004\u0008\u0008\u0010\t\u00a8\u0006\u000b"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified$ModifiedToAllowlistedSize;",
        "Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;",
        "newUrl",
        "Landroid/net/Uri;",
        "bestAllowlistedSize",
        "",
        "<init>",
        "(Landroid/net/Uri;Ljava/lang/Integer;)V",
        "getBestAllowlistedSize",
        "()Ljava/lang/Integer;",
        "Ljava/lang/Integer;",
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
.field private final bestAllowlistedSize:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/Integer;)V
    .locals 2

    const-string v0, "newUrl"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 42
    const-string v0, "ModifiedToAllowlistedSize"

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified;-><init>(Landroid/net/Uri;Ljava/lang/String;Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 41
    iput-object p2, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified$ModifiedToAllowlistedSize;->bestAllowlistedSize:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public getBestAllowlistedSize()Ljava/lang/Integer;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/facebook/fresco/urimod/UriModifierInterface$ModificationResult$Modified$ModifiedToAllowlistedSize;->bestAllowlistedSize:Ljava/lang/Integer;

    return-object v0
.end method
