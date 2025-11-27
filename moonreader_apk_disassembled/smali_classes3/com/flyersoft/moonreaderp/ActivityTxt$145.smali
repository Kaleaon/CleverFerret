.class Lcom/flyersoft/moonreaderp/ActivityTxt$145;
.super Ljava/util/TimerTask;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->checkRemindEvent()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$timeTv:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 14474
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->val$timeTv:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 14477
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$145;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$145$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$145;)V

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
