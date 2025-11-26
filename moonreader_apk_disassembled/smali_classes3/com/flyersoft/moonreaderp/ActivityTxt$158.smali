.class Lcom/flyersoft/moonreaderp/ActivityTxt$158;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 15879
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 15881
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mforceShowSelectBar(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    .line 15882
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const/4 p1, -0x1

    if-eq v0, v2, :cond_1

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    goto/16 :goto_1

    .line 15891
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    if-eqz v0, :cond_5

    .line 15892
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getTop()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mselect_move_down(Lcom/flyersoft/moonreaderp/ActivityTxt;F)V

    .line 15893
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->hLastX:I

    sub-int/2addr v0, v3

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getDotCutoffLeft()I

    move-result v3

    sub-int/2addr v0, v3

    .line 15894
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    float-to-int p2, p2

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->hLastY:I

    sub-int/2addr p2, v3

    .line 15895
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v4, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v0, p2, v5}, Lcom/flyersoft/moonreaderp/ActivityTxt;->dotLayout(Landroid/view/View;IIZ)V

    .line 15896
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->postInvalidate()V

    .line 15897
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object v1, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->preNoteInfo:Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 15898
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2, v5, p1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhighlightText(Lcom/flyersoft/moonreaderp/ActivityTxt;ZII)V

    .line 15899
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mreleaseMagnifier(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    goto :goto_1

    .line 15903
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    if-eqz p2, :cond_5

    .line 15904
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p2, v2, p1, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhighlightText(Lcom/flyersoft/moonreaderp/ActivityTxt;ZII)V

    .line 15905
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object v1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    goto :goto_1

    .line 15884
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot1:Lcom/flyersoft/views/DotImageView;

    if-eq p1, v3, :cond_4

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot2:Lcom/flyersoft/views/DotImageView;

    if-ne p1, v3, :cond_3

    goto :goto_0

    :cond_3
    move-object p1, v1

    :cond_4
    :goto_0
    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    .line 15885
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    if-eqz p1, :cond_5

    .line 15886
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawX()F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    move-result v1

    sub-int/2addr v0, v1

    iput v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hLastX:I

    .line 15887
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getRawY()F

    move-result p2

    float-to-int p2, p2

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$158;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    sub-int/2addr p2, v0

    iput p2, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hLastY:I

    :cond_5
    :goto_1
    return v2
.end method
