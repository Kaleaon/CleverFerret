.class Lcom/flyersoft/moonreaderp/ActivityTxt$81;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showUrlFootnote(Ljava/lang/String;Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$title:Ljava/lang/String;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 8688
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->val$url:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->val$title:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 8691
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->hidePop(Z)Z

    .line 8692
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputcheckUrlFootnote(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 8693
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v1, 0x0

    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputurlFootnote(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;)V

    .line 8694
    new-instance p1, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {p1, p0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$81;Landroid/os/Looper;)V

    const-wide/16 v1, 0x32

    .line 8698
    invoke-virtual {p1, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method
