.class Lcom/flyersoft/moonreaderp/ActivityTxt$232;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->eraseGPUShadow(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 21240
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$232;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 21242
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v0, 0x32

    if-ne p1, v0, :cond_0

    .line 21243
    sget-object p1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 21244
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->baseFrame:Landroid/widget/FrameLayout;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->setBackgroundImage(Landroid/view/View;)V

    return-void
.end method
