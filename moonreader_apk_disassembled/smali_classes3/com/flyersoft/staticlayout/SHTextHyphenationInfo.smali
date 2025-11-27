.class final Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;
.super Ljava/lang/Object;
.source "SHTextHyphenator.java"


# instance fields
.field final Mask:[Z


# direct methods
.method public constructor <init>(I)V
    .locals 0

    .line 433
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    add-int/lit8 p1, p1, -0x1

    .line 434
    new-array p1, p1, [Z

    iput-object p1, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;->Mask:[Z

    return-void
.end method


# virtual methods
.method public isHyphenationPossible(I)Z
    .locals 2

    .line 438
    iget-object v0, p0, Lcom/flyersoft/staticlayout/SHTextHyphenationInfo;->Mask:[Z

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget-boolean p1, v0, p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
