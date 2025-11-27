.class Lcom/flyersoft/views/PopupNoteLay$1;
.super Ljava/lang/Object;
.source "PopupNoteLay.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/PopupNoteLay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/PopupNoteLay;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/PopupNoteLay;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 151
    iput-object p1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 5

    .line 154
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/PopupNoteLay;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->onPreDraw:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 155
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 158
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/PopupNoteLay;->getWidth()I

    move-result v0

    .line 159
    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->parent:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getWidth()I

    move-result v1

    const/4 v2, 0x0

    if-ge v0, v1, :cond_2

    .line 164
    iget-object v3, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget v3, v3, Lcom/flyersoft/views/PopupNoteLay;->x:I

    div-int/lit8 v4, v0, 0x2

    sub-int/2addr v3, v4

    add-int v4, v3, v0

    .line 166
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-le v4, v1, :cond_1

    sub-int/2addr v4, v1

    sub-int/2addr v3, v4

    if-gez v3, :cond_1

    const/4 v3, 0x0

    .line 172
    :cond_1
    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->base_lp:Landroid/widget/FrameLayout$LayoutParams;

    iput v3, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 175
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->sv:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getPaddingLeft()I

    move-result v1

    iget-object v4, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v4, v4, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v4}, Landroid/widget/ImageView;->getWidth()I

    move-result v4

    add-int/2addr v1, v4

    .line 176
    iget-object v4, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget v4, v4, Lcom/flyersoft/views/PopupNoteLay;->x:I

    sub-int/2addr v4, v3

    iget-object v3, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v3, v3, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    sub-int/2addr v4, v3

    if-ge v4, v1, :cond_3

    goto :goto_1

    :cond_3
    sub-int v1, v0, v1

    if-le v4, v1, :cond_4

    goto :goto_1

    :cond_4
    move v1, v4

    .line 181
    :goto_1
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 182
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 184
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v0, Lcom/flyersoft/views/PopupNoteLay;->arrow_lp:Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iget-object v3, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v3, v3, Lcom/flyersoft/views/PopupNoteLay;->arrow:Landroid/widget/ImageView;

    invoke-virtual {v3}, Landroid/widget/ImageView;->getWidth()I

    move-result v3

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v1, v3

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Lcom/flyersoft/views/PopupNoteLay;->setPivotX(F)V

    .line 185
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget v1, v0, Lcom/flyersoft/views/PopupNoteLay;->gravity:I

    const/16 v3, 0x30

    if-ne v1, v3, :cond_5

    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    invoke-virtual {v1}, Lcom/flyersoft/views/PopupNoteLay;->getHeight()I

    move-result v1

    int-to-float v1, v1

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Lcom/flyersoft/views/PopupNoteLay;->setPivotY(F)V

    .line 187
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-boolean v0, v0, Lcom/flyersoft/views/PopupNoteLay;->buttonOnTop:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->tv:Landroid/widget/TextView;

    .line 188
    invoke-virtual {v0}, Landroid/widget/TextView;->getHeight()I

    move-result v0

    iget-object v1, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v1, v1, Lcom/flyersoft/views/PopupNoteLay;->sv:Landroid/widget/ScrollView;

    invoke-virtual {v1}, Landroid/widget/ScrollView;->getHeight()I

    move-result v1

    if-le v0, v1, :cond_6

    .line 189
    iget-object v0, p0, Lcom/flyersoft/views/PopupNoteLay$1;->this$0:Lcom/flyersoft/views/PopupNoteLay;

    iget-object v0, v0, Lcom/flyersoft/views/PopupNoteLay;->button:Landroid/widget/TextView;

    const v1, 0x33888888

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    :cond_6
    return v2
.end method
