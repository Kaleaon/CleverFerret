.class Lcom/flyersoft/moonreaderp/ActivityTxt$75$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$75;->onStopTrackingTouch(Landroid/widget/SeekBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$75;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$75;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6436
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$75;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 6439
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$75$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$75;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$75;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdfShowLockIcon(ZZ)V

    return-void
.end method
