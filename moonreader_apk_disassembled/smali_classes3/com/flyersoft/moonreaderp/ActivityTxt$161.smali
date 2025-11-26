.class Lcom/flyersoft/moonreaderp/ActivityTxt$161;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->fadeSelectBar()V
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

    .line 16020
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 16026
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetselectBarFading(Lcom/flyersoft/moonreaderp/ActivityTxt;)Z

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 16028
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mhideDotSelectors(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 16029
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msetHBarVisible(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 16030
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot1:Lcom/flyersoft/views/DotImageView;

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/DotImageView;->setVisibility(I)V

    .line 16031
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->dot2:Lcom/flyersoft/views/DotImageView;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/DotImageView;->setVisibility(I)V

    .line 16032
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$161;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->hBar:Lcom/flyersoft/views/HighlightLay;

    invoke-virtual {p1, v0}, Lcom/flyersoft/views/HighlightLay;->setVisibility(I)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
