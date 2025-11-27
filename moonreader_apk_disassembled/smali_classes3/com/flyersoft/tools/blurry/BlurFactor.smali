.class Lcom/flyersoft/tools/blurry/BlurFactor;
.super Ljava/lang/Object;
.source "BlurFactor.java"


# static fields
.field public static final DEFAULT_RADIUS:I = 0x19

.field public static final DEFAULT_SAMPLING:I = 0x1


# instance fields
.field public color:I

.field public height:I

.field public radius:I

.field public sampling:I

.field public width:I


# direct methods
.method constructor <init>()V
    .locals 1

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x19

    .line 28
    iput v0, p0, Lcom/flyersoft/tools/blurry/BlurFactor;->radius:I

    const/4 v0, 0x1

    .line 29
    iput v0, p0, Lcom/flyersoft/tools/blurry/BlurFactor;->sampling:I

    const/4 v0, 0x0

    .line 30
    iput v0, p0, Lcom/flyersoft/tools/blurry/BlurFactor;->color:I

    return-void
.end method
