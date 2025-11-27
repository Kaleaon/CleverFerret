.class Lcom/flyersoft/moonreaderp/ActivityTxt$112;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->do_autoscroll_message()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$isRollingLine:Z

.field final synthetic val$l:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V
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

    .line 12042
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->val$l:I

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->val$isRollingLine:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 3

    .line 12045
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputjustStartScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    .line 12046
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    iput v0, p1, Lcom/flyersoft/views/ScrollImage;->topLine:I

    .line 12047
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->val$l:I

    iget-boolean v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->val$isRollingLine:Z

    invoke-static {p1, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mdo_autoscroll_message_step2(Lcom/flyersoft/moonreaderp/ActivityTxt;IZ)V

    .line 12048
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$112;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputautoScrollPaused(Lcom/flyersoft/moonreaderp/ActivityTxt;Z)V

    return-void
.end method
