.class Lcom/flyersoft/moonreaderp/ActivityTxt$47;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showBottomIconsHint()V
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

    .line 3755
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 3758
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->layoutVisible:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->pop:Lcom/flyersoft/views/PopupNoteLay;

    invoke-virtual {v0}, Lcom/flyersoft/views/PopupNoteLay;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 3759
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    .line 3760
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$47;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->customizeB:Landroid/widget/ImageView;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v2, v1}, Lcom/flyersoft/tools/miscellaneous/AnimalTools;->startJdllyAnimal(Landroid/view/View;FZ)V

    :cond_0
    return-void
.end method
