.class public Lcom/flyersoft/views/recyclerview/SizeLinearLayout;
.super Landroid/widget/LinearLayout;
.source "SizeLinearLayout.java"


# instance fields
.field mAtRight:Z

.field mReduceSize:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 12
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 16
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 20
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method


# virtual methods
.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 29
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mReduceSize:Z

    if-eqz v0, :cond_1

    .line 30
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 31
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->getWidth()I

    move-result v0

    mul-int/lit8 v0, v0, 0xa

    iget-boolean v1, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mAtRight:Z

    if-eqz v1, :cond_0

    const/16 v1, 0xf

    goto :goto_0

    :cond_0
    const/16 v1, 0x3c

    :goto_0
    div-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    const v2, 0x3f333333    # 0.7f

    invoke-virtual {p1, v2, v2, v0, v1}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 34
    :cond_1
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 36
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mReduceSize:Z

    if-eqz v0, :cond_2

    .line 37
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_2
    return-void
.end method

.method public setReduceSize(ZZ)V
    .locals 1

    .line 44
    iget-boolean v0, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mReduceSize:Z

    if-eq v0, p1, :cond_0

    .line 45
    iput-boolean p1, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mReduceSize:Z

    .line 46
    iput-boolean p2, p0, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->mAtRight:Z

    .line 47
    invoke-virtual {p0}, Lcom/flyersoft/views/recyclerview/SizeLinearLayout;->invalidate()V

    :cond_0
    return-void
.end method
