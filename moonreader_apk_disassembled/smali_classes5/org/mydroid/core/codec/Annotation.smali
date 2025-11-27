.class public Lorg/mydroid/core/codec/Annotation;
.super Landroid/graphics/RectF;
.source "Annotation.java"


# instance fields
.field private index:I

.field private page:I

.field private pageHandler:J

.field public final text:Ljava/lang/String;

.field public final type:Lorg/mydroid/core/codec/AnnotationType;


# direct methods
.method public constructor <init>(FFFFILjava/lang/String;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 p1, -0x1

    if-ne p5, p1, :cond_0

    .line 16
    sget-object p1, Lorg/mydroid/core/codec/AnnotationType;->UNKNOWN:Lorg/mydroid/core/codec/AnnotationType;

    goto :goto_0

    :cond_0
    invoke-static {}, Lorg/mydroid/core/codec/AnnotationType;->values()[Lorg/mydroid/core/codec/AnnotationType;

    move-result-object p1

    aget-object p1, p1, p5

    :goto_0
    iput-object p1, p0, Lorg/mydroid/core/codec/Annotation;->type:Lorg/mydroid/core/codec/AnnotationType;

    .line 17
    iput-object p6, p0, Lorg/mydroid/core/codec/Annotation;->text:Ljava/lang/String;

    const/4 p1, 0x2

    .line 18
    new-array p1, p1, [Ljava/lang/Object;

    const-string p2, "Annotation text2"

    const/4 p3, 0x0

    aput-object p2, p1, p3

    const/4 p2, 0x1

    aput-object p6, p1, p2

    invoke-static {p1}, Lorg/mydroid/core/codec/LOG;->d([Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/graphics/RectF;-><init>()V

    .line 22
    iput p1, p0, Lorg/mydroid/core/codec/Annotation;->page:I

    .line 23
    iput p2, p0, Lorg/mydroid/core/codec/Annotation;->index:I

    .line 24
    sget-object p1, Lorg/mydroid/core/codec/AnnotationType;->INK:Lorg/mydroid/core/codec/AnnotationType;

    iput-object p1, p0, Lorg/mydroid/core/codec/Annotation;->type:Lorg/mydroid/core/codec/AnnotationType;

    .line 25
    const-string p1, ""

    iput-object p1, p0, Lorg/mydroid/core/codec/Annotation;->text:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2

    .line 30
    iget v0, p0, Lorg/mydroid/core/codec/Annotation;->index:I

    check-cast p1, Lorg/mydroid/core/codec/Annotation;

    iget v1, p1, Lorg/mydroid/core/codec/Annotation;->index:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lorg/mydroid/core/codec/Annotation;->page:I

    iget p1, p1, Lorg/mydroid/core/codec/Annotation;->page:I

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public getIndex()I
    .locals 1

    .line 34
    iget v0, p0, Lorg/mydroid/core/codec/Annotation;->index:I

    return v0
.end method

.method public getPage()I
    .locals 1

    .line 42
    iget v0, p0, Lorg/mydroid/core/codec/Annotation;->page:I

    return v0
.end method

.method public getPageHandler()J
    .locals 2

    .line 50
    iget-wide v0, p0, Lorg/mydroid/core/codec/Annotation;->pageHandler:J

    return-wide v0
.end method

.method public setIndex(I)V
    .locals 0

    .line 38
    iput p1, p0, Lorg/mydroid/core/codec/Annotation;->index:I

    return-void
.end method

.method public setPage(I)V
    .locals 0

    .line 46
    iput p1, p0, Lorg/mydroid/core/codec/Annotation;->page:I

    return-void
.end method

.method public setPageHandler(J)V
    .locals 0

    .line 54
    iput-wide p1, p0, Lorg/mydroid/core/codec/Annotation;->pageHandler:J

    return-void
.end method
