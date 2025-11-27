.class Lcom/flyersoft/moonreaderp/ActivityTxt$80;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->openUrlLink(Ljava/lang/String;Ljava/lang/String;J)V
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
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Landroid/os/Looper;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null
        }
    .end annotation

    .line 8336
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->val$url:Ljava/lang/String;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->val$title:Ljava/lang/String;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 8339
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getTouchTxtView()Lcom/flyersoft/staticlayout/MRTextView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/staticlayout/MRTextView;->invalidate()V

    .line 8340
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->val$url:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$80;->val$title:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenUrlLinkHandler(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
