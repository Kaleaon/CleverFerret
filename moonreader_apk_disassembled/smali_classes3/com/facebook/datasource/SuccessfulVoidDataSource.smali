.class public final Lcom/facebook/datasource/SuccessfulVoidDataSource;
.super Lcom/facebook/datasource/AbstractDataSource;
.source "SuccessfulVoidDataSource.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/datasource/AbstractDataSource<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0003\u0010\u0004\u00a8\u0006\u0005"
    }
    d2 = {
        "Lcom/facebook/datasource/SuccessfulVoidDataSource;",
        "Lcom/facebook/datasource/AbstractDataSource;",
        "Ljava/lang/Void;",
        "<init>",
        "()V",
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
.field public static final INSTANCE:Lcom/facebook/datasource/SuccessfulVoidDataSource;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Lcom/facebook/datasource/SuccessfulVoidDataSource;

    invoke-direct {v0}, Lcom/facebook/datasource/SuccessfulVoidDataSource;-><init>()V

    sput-object v0, Lcom/facebook/datasource/SuccessfulVoidDataSource;->INSTANCE:Lcom/facebook/datasource/SuccessfulVoidDataSource;

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, v2}, Lcom/facebook/datasource/SuccessfulVoidDataSource;->setResult(Ljava/lang/Object;Z)Z

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 10
    invoke-direct {p0}, Lcom/facebook/datasource/AbstractDataSource;-><init>()V

    return-void
.end method
