.class public final Lcom/facebook/memory/helper/HashCode;
.super Ljava/lang/Object;
.source "HashCode.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001a\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0001H\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/facebook/memory/helper/HashCode;",
        "",
        "<init>",
        "()V",
        "extend",
        "",
        "current",
        "obj",
        "fbcore_release"
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
.field public static final INSTANCE:Lcom/facebook/memory/helper/HashCode;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/facebook/memory/helper/HashCode;

    invoke-direct {v0}, Lcom/facebook/memory/helper/HashCode;-><init>()V

    sput-object v0, Lcom/facebook/memory/helper/HashCode;->INSTANCE:Lcom/facebook/memory/helper/HashCode;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final extend(ILjava/lang/Object;)I
    .locals 0
    .annotation runtime Lkotlin/jvm/JvmStatic;
    .end annotation

    mul-int/lit8 p0, p0, 0x1f

    if-eqz p1, :cond_0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    add-int/2addr p0, p1

    return p0
.end method
