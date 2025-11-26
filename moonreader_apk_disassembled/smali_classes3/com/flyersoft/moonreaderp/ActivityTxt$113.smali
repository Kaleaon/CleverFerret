.class Lcom/flyersoft/moonreaderp/ActivityTxt$113;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_autoscroll_message_step2(IZ)V
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

    .line 12132
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$113;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    .line 12135
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$113;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputautoScrollPaused(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 12136
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$113;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$113;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fgetscrollPos(Lcom/flyersoft/moonreaderp/ActivityTxt;)I

    move-result v0

    iput v0, p1, Lcom/flyersoft/views/ScrollImage;->topLine:I

    .line 12137
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$113;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    invoke-virtual {p1}, Lcom/flyersoft/views/ScrollImage;->invalidate()V

    return-void
.end method
