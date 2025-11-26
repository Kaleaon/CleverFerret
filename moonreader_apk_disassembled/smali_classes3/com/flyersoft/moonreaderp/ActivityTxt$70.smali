.class Lcom/flyersoft/moonreaderp/ActivityTxt$70;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->initBrightSeek()V
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

    .line 6341
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2

    const/4 p1, 0x0

    if-eqz p2, :cond_0

    .line 6344
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/16 v0, -0x64

    invoke-virtual {p2, v0, p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    goto :goto_0

    .line 6346
    :cond_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessSK:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    add-int/lit8 v0, v0, -0x32

    const/4 v1, 0x1

    invoke-virtual {p2, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->setScreenBrightness(IZ)V

    .line 6347
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessPanel:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->clearAnimation()V

    .line 6348
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$70;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityTxt;->brightnessPanel:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
