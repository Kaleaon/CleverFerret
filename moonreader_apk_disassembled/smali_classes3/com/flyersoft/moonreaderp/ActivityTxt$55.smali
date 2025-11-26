.class Lcom/flyersoft/moonreaderp/ActivityTxt$55;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


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

    .line 5498
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 5506
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollCache:Lcom/flyersoft/views/ScrollView2;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/flyersoft/views/ScrollView2;->recordDrawCount:Z

    .line 5507
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoValueAnimationEnd(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 5501
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result p1

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    mul-int/lit8 v0, v0, 0x3

    div-int/lit8 v0, v0, 0x2

    if-ge p1, v0, :cond_0

    .line 5502
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtCache:Lcom/flyersoft/staticlayout/MRTextView;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$55;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getHeight()I

    move-result v0

    mul-int/lit8 v0, v0, 0x2

    invoke-static {p1, v0}, Lcom/flyersoft/tools/A;->setViewBottom(Landroid/view/View;I)V

    :cond_0
    return-void
.end method
