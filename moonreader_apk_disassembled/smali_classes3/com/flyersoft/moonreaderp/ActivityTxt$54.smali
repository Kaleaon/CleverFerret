.class Lcom/flyersoft/moonreaderp/ActivityTxt$54;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->shiftAnimateWithValue()V
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

    .line 5488
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 3

    .line 5491
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueExecuteCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->valueExecuteCount:I

    .line 5492
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 5493
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtScroll:Lcom/flyersoft/views/ScrollView2;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iput-wide v1, v0, Lcom/flyersoft/views/ScrollView2;->lastDrawTime:J

    if-eqz p1, :cond_0

    .line 5495
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$54;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setValueAnimationPos(IZZ)V

    :cond_0
    return-void
.end method
