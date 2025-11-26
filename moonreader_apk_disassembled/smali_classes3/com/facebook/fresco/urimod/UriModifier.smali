.class public final Lcom/facebook/fresco/urimod/UriModifier;
.super Ljava/lang/Object;
.source "UriModifier.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0012\u0010\u0004\u001a\u00020\u00058\u0006@\u0006X\u0087\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0006"
    }
    d2 = {
        "Lcom/facebook/fresco/urimod/UriModifier;",
        "",
        "<init>",
        "()V",
        "INSTANCE",
        "Lcom/facebook/fresco/urimod/UriModifierInterface;",
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


# static fields
.field public static final INSTANCE:Lcom/facebook/fresco/urimod/UriModifier;

.field public static INSTANCE:Lcom/facebook/fresco/urimod/UriModifierInterface;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/fresco/urimod/UriModifier;

    invoke-direct {v0}, Lcom/facebook/fresco/urimod/UriModifier;-><init>()V

    sput-object v0, Lcom/facebook/fresco/urimod/UriModifier;->INSTANCE:Lcom/facebook/fresco/urimod/UriModifier;

    .line 11
    sget-object v0, Lcom/facebook/fresco/urimod/NopUriModifier;->INSTANCE:Lcom/facebook/fresco/urimod/NopUriModifier;

    check-cast v0, Lcom/facebook/fresco/urimod/UriModifierInterface;

    sput-object v0, Lcom/facebook/fresco/urimod/UriModifier;->INSTANCE:Lcom/facebook/fresco/urimod/UriModifierInterface;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
