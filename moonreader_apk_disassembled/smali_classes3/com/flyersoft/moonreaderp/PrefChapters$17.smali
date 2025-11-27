.class Lcom/flyersoft/moonreaderp/PrefChapters$17;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->swipeToClose(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1077
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1081
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/high16 v0, -0x40800000    # -1.0f

    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    .line 1083
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_0

    .line 1084
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    .line 1085
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startY:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    .line 1086
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    iput v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startY:F

    .line 1087
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    const/4 v2, 0x0

    cmpl-float p1, p1, v2

    if-eqz p1, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    sub-float/2addr p1, v3

    const/high16 v3, 0x41a00000    # 20.0f

    invoke-static {v3}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v3

    int-to-float v3, v3

    cmpl-float p1, p1, v3

    if-lez p1, :cond_2

    .line 1088
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    .line 1090
    :cond_2
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v2, 0x1

    if-ne p1, v2, :cond_5

    .line 1091
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    sub-float/2addr p1, v3

    .line 1092
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-boolean v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters;->showImageTab:Z

    if-eqz v3, :cond_3

    goto :goto_0

    :cond_3
    const/4 v1, 0x1

    .line 1094
    :goto_0
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters;->tabIndex:I

    if-ne v2, v1, :cond_4

    const/high16 v1, 0x42700000    # 60.0f

    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    int-to-float v1, v1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_4

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->startY:F

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    sub-float/2addr v1, p2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_4

    .line 1095
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->dismiss()V

    .line 1096
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$17;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startY:F

    iput v0, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->startX:F

    :cond_5
    const/4 p1, 0x0

    return p1
.end method
