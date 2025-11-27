.class public Lcom/flyersoft/views/DotImageView;
.super Landroid/widget/ImageView;
.source "DotImageView.java"


# instance fields
.field private dBottom:I

.field private dLeft:I

.field private dRight:I

.field private dTop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dLeft:I

    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dLeft:I

    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 18
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 38
    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dLeft:I

    iput p1, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 0

    .line 23
    invoke-virtual {p0}, Lcom/flyersoft/views/DotImageView;->isInEditMode()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    if-nez p2, :cond_3

    if-nez p3, :cond_3

    .line 26
    iget p1, p0, Lcom/flyersoft/views/DotImageView;->dLeft:I

    if-nez p1, :cond_2

    iget p2, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    :goto_0
    return-void

    .line 27
    :cond_2
    :goto_1
    iget p2, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    iget p3, p0, Lcom/flyersoft/views/DotImageView;->dRight:I

    iget p4, p0, Lcom/flyersoft/views/DotImageView;->dBottom:I

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flyersoft/views/DotImageView;->layout(IIII)V

    return-void

    .line 30
    :cond_3
    iput p2, p0, Lcom/flyersoft/views/DotImageView;->dLeft:I

    .line 31
    iput p3, p0, Lcom/flyersoft/views/DotImageView;->dTop:I

    .line 32
    iput p4, p0, Lcom/flyersoft/views/DotImageView;->dRight:I

    .line 33
    iput p5, p0, Lcom/flyersoft/views/DotImageView;->dBottom:I

    return-void
.end method
