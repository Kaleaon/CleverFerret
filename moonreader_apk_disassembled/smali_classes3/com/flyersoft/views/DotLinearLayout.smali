.class public Lcom/flyersoft/views/DotLinearLayout;
.super Landroid/widget/LinearLayout;
.source "DotLinearLayout.java"


# instance fields
.field private dBottom:I

.field private dLeft:I

.field private dRight:I

.field private dTop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/flyersoft/views/DotLinearLayout;->dLeft:I

    iput p1, p0, Lcom/flyersoft/views/DotLinearLayout;->dTop:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 33
    iput p1, p0, Lcom/flyersoft/views/DotLinearLayout;->dLeft:I

    iput p1, p0, Lcom/flyersoft/views/DotLinearLayout;->dTop:I

    return-void
.end method


# virtual methods
.method protected onLayout(ZIIII)V
    .locals 6

    if-nez p2, :cond_2

    if-nez p3, :cond_2

    .line 21
    iget p1, p0, Lcom/flyersoft/views/DotLinearLayout;->dLeft:I

    if-nez p1, :cond_1

    iget p2, p0, Lcom/flyersoft/views/DotLinearLayout;->dTop:I

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    return-void

    .line 22
    :cond_1
    :goto_0
    iget p2, p0, Lcom/flyersoft/views/DotLinearLayout;->dTop:I

    iget p3, p0, Lcom/flyersoft/views/DotLinearLayout;->dRight:I

    iget p4, p0, Lcom/flyersoft/views/DotLinearLayout;->dBottom:I

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flyersoft/views/DotLinearLayout;->layout(IIII)V

    return-void

    .line 25
    :cond_2
    iput p2, p0, Lcom/flyersoft/views/DotLinearLayout;->dLeft:I

    .line 26
    iput p3, p0, Lcom/flyersoft/views/DotLinearLayout;->dTop:I

    .line 27
    iput p4, p0, Lcom/flyersoft/views/DotLinearLayout;->dRight:I

    .line 28
    iput p5, p0, Lcom/flyersoft/views/DotLinearLayout;->dBottom:I

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 29
    invoke-super/range {v0 .. v5}, Landroid/widget/LinearLayout;->onLayout(ZIIII)V

    return-void
.end method
