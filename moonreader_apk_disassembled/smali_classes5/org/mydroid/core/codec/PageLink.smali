.class public Lorg/mydroid/core/codec/PageLink;
.super Ljava/lang/Object;
.source "PageLink.java"


# instance fields
.field public number:I

.field public sourceRect:Landroid/graphics/RectF;

.field public targetPage:I

.field public targetRect:Landroid/graphics/RectF;

.field public url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lorg/mydroid/core/codec/PageLink;->targetPage:I

    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lorg/mydroid/core/codec/PageLink;->number:I

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[I)V
    .locals 4

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lorg/mydroid/core/codec/PageLink;->targetPage:I

    const/4 v0, 0x0

    .line 13
    iput v0, p0, Lorg/mydroid/core/codec/PageLink;->number:I

    .line 19
    iput-object p1, p0, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    .line 20
    new-instance p1, Landroid/graphics/RectF;

    aget v0, p2, v0

    int-to-float v0, v0

    const/4 v1, 0x1

    aget v1, p2, v1

    int-to-float v1, v1

    const/4 v2, 0x2

    aget v2, p2, v2

    int-to-float v2, v2

    const/4 v3, 0x3

    aget p2, p2, v3

    int-to-float p2, p2

    invoke-direct {p1, v0, v1, v2, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lorg/mydroid/core/codec/PageLink;->sourceRect:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 25
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    const-string v1, "[source="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    iget-object v1, p0, Lorg/mydroid/core/codec/PageLink;->sourceRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 28
    iget-object v1, p0, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 29
    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    iget-object v1, p0, Lorg/mydroid/core/codec/PageLink;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    :cond_0
    iget v1, p0, Lorg/mydroid/core/codec/PageLink;->targetPage:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 33
    const-string v1, ", target="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    iget v1, p0, Lorg/mydroid/core/codec/PageLink;->targetPage:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 35
    iget-object v1, p0, Lorg/mydroid/core/codec/PageLink;->targetRect:Landroid/graphics/RectF;

    if-eqz v1, :cond_1

    .line 36
    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/mydroid/core/codec/PageLink;->targetRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    :cond_1
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
