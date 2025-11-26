.class Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;
.super Landroid/os/Handler;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$81;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$81;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$81;Landroid/os/Looper;)V
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

    .line 8694
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$81;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 8696
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$81;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$81;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->val$url:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$81$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$81;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$81;->val$title:Ljava/lang/String;

    const-wide/16 v2, 0x32

    invoke-static {p1, v0, v1, v2, v3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mopenUrlLink(Lcom/flyersoft/moonreaderp/ActivityTxt;Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method
