.class Lcom/flyersoft/moonreaderp/ActivityTxt$181;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->loadTheme(Ljava/lang/String;Z)V
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

    .line 18140
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$181;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 18142
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$181;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v0}, Lcom/flyersoft/staticlayout/MRTextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mtxtViewSetText(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/CharSequence;)V

    .line 18143
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$181;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mgoToEBookLastPosition(Lcom/flyersoft/moonreaderp/ActivityTxt;)V

    return-void
.end method
