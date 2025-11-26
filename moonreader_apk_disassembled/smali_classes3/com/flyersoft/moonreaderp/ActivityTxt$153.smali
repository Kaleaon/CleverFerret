.class Lcom/flyersoft/moonreaderp/ActivityTxt$153;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->error_and_exit(Ljava/lang/String;Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$oom:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V
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

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 15538
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$153;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$153;->val$oom:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 15540
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$153;->val$oom:Z

    if-eqz p1, :cond_0

    .line 15541
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$153;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->restartReaderToMain()V

    return-void

    .line 15543
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$153;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdoFinish(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
